# ============================================================
# ANALISIS TAMBAHAN = SHAP + ANALISIS KESALAHAN + TUNING OPTUNA (tanpa kebocoran) + TABEL METRIK LENGKAP
# ------------------------------------------------------------
# Satu sel, jalankan setelah figur dan metrik tambahan. Tidak mengubah file lama; hasil masuk ke folder baru:
#   QPR_SF10_Research/artikel_gambar/analisis_lanjutan/
# Isi:
#  1. Tabel metrik lengkap (Acc, Precision, Recall, F1, Macro F1, PR-AUC, ROC-AUC, latensi) untuk
#     Detektor Pola Wu, aturan rasio biaya, regresi logistik, XGBoost x2, random forest, Gabungan peringkat
#  2. SHAP (TreeSHAP) untuk XGBoost Kardinalitas Lokal: ringkasan beeswarm + batang per variabel + per kelompok
#  3. Analisis kesalahan Gabungan vs Detektor Pola Wu (FN dan FP dekat ambang rasio 1,5x)
#  4. Tuning Optuna tanpa kebocoran (validasi silang per template DI DALAM data latih saja),
#     lalu uji pada data sisi lain; dibandingkan dengan pengaturan bawaan
# Label utama: label_v2. Perkiraan waktu: 10 sampai 20 menit di Colab.
# ============================================================
import subprocess, sys
def _pip(*pk):
    subprocess.run([sys.executable, "-m", "pip", "install", "-q", *pk], check=False)
try:
    import shap  # noqa
except Exception:
    _pip("shap")
try:
    import optuna  # noqa
except Exception:
    _pip("optuna")

import os, time, json, warnings
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import xgboost as xgb_lib
from xgboost import XGBClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline
from sklearn.metrics import average_precision_score, roc_auc_score
from sklearn.model_selection import StratifiedGroupKFold
from scipy.stats import rankdata
warnings.filterwarnings("ignore")

DRIVE_ROOT = Path(os.environ.get("QPR_ROOT", "/content/drive/MyDrive/QPR_SF10_Research"))
OLD_ROOT = DRIVE_ROOT / "incremental"
NEW_ROOT = DRIVE_ROOT / "fresh" / "incremental_fresh"
OUT = DRIVE_ROOT / "artikel_gambar" / "analisis_lanjutan"; OUT.mkdir(parents=True, exist_ok=True)
OLD_FEAT = OLD_ROOT / "incremental_m0_m2b_features.csv"
OLD_V2 = OLD_ROOT / "remeasure" / "remeasure_labels_v2.csv"
NEW_FEAT = NEW_ROOT / "incremental_m0_m2b_features.csv"
NEW_V2 = NEW_ROOT / "remeasure" / "remeasure_labels_v2.csv"
SEEDS = [42, 43, 44, 45, 46]
LAB = "label_v2"
N_TRIALS = int(os.environ.get("QPR_TRIALS", "30"))
for p in [OLD_FEAT, OLD_V2, NEW_FEAT, NEW_V2]:
    assert p.exists(), f"File tidak ditemukan: {p}"

# ---------- data ----------
v2_old = pd.read_csv(OLD_V2); v2_new = pd.read_csv(NEW_V2)
old = pd.read_csv(OLD_FEAT).merge(v2_old[[c for c in v2_old.columns if c in ("sample_id", "label_v1", "label_v2")]],
                                  on="sample_id", how="inner")
new = pd.read_csv(NEW_FEAT)
new["label_v1"] = new["label"].astype(int)
new = new.merge(v2_new[["sample_id", "label_v2"]], on="sample_id", how="left")
old = old[old[LAB].notna()].reset_index(drop=True); new = new[new[LAB].notna()].reset_index(drop=True)
old["batch"] = "lama"; new["batch"] = "baru"

# rasio waktu untuk analisis kesalahan: pakai rasio berulang (v2) kalau ada, kalau tidak rasio satu kali jalan
def pick_ratio(d, v2):
    if "ratio_v2" in v2.columns:                       # rasio median jalan berulang (sesudah/sebelum)
        return d[["sample_id"]].merge(v2[["sample_id", "ratio_v2"]], on="sample_id", how="left")["ratio_v2"].astype(float), "ratio_v2 (file label v2)"
    if "runtime_ratio" in d.columns:
        return d["runtime_ratio"].astype(float), "runtime_ratio (satu kali jalan, lebih berisik)"
    if {"before_elapsed_ms", "after_elapsed_ms"} <= set(d.columns):
        return (d["after_elapsed_ms"] / d["before_elapsed_ms"].clip(lower=1e-9)).astype(float), "after/before elapsed (satu kali jalan)"
    return pd.Series(np.nan, index=d.index), "TIDAK ADA"
old["ratio"], r_old = pick_ratio(old, v2_old); new["ratio"], r_new = pick_ratio(new, v2_new)
print("Sumber rasio waktu -> data lama:", r_old, "| data baru:", r_new)

forbidden = {"before_elapsed_ms", "after_elapsed_ms", "runtime_ratio", "label", "label_v1", "label_v2", "kepastian_v2",
             "label_v1_file", "ratio", "batch"}
def cols_with(prefixes, exact=()):
    return [c for c in old.columns if c not in forbidden and not c.startswith("m0_") and "elapsed_ms" not in c
            and (c.startswith(tuple(prefixes)) or c in exact) and pd.api.types.is_numeric_dtype(old[c])]
BASE = ["before_", "candidate_", "delta_"]
M1_COLS = cols_with(BASE, ("estimated_cost_ratio",))
ALL_COLS = cols_with(BASE + ["ce_", "loc_"], ("estimated_cost_ratio",))
assert all(c in new.columns for c in ALL_COLS)
print(f"Transisi lama {len(old)} (Regression {int(old[LAB].sum())}), baru {len(new)} (Regression {int(new[LAB].sum())}); "
      f"variabel M1 {len(M1_COLS)}, M2b {len(ALL_COLS)}")

def prep(d, cols): return d[cols].replace([np.inf, -np.inf], np.nan).fillna(0.0).reset_index(drop=True)
def xgb(y, seed, **extra):
    pos = int((y == 1).sum()); neg = int((y == 0).sum())
    base = dict(objective="binary:logistic", n_estimators=200, learning_rate=0.05, max_depth=3, min_child_weight=1,
                subsample=0.8, colsample_bytree=0.8, reg_lambda=2.0, reg_alpha=0.0, scale_pos_weight=neg / max(pos, 1),
                eval_metric="logloss", tree_method="hist", n_jobs=2, random_state=seed, verbosity=0)
    base.update(extra); return XGBClassifier(**base)
def rforest(y, seed):
    return RandomForestClassifier(n_estimators=300, max_depth=5, min_samples_leaf=2, class_weight="balanced_subsample",
                                  n_jobs=2, random_state=seed)
def logreg(y, seed):
    return make_pipeline(StandardScaler(), LogisticRegression(C=0.1, class_weight="balanced", max_iter=2000, random_state=seed))
def slog(X): return np.sign(X) * np.log1p(np.abs(X))   # log bertanda untuk variabel berskala besar (khusus regresi logistik)
def rank01(p): return (rankdata(p) - 1) / max(len(p) - 1, 1)
def topk(prob, k):
    p = np.zeros(len(prob), dtype=int); p[np.argsort(-prob, kind="stable")[:k]] = 1; return p
def f1_of(tp, fp, fn): return 2 * tp / (2 * tp + fp + fn) if (2 * tp + fp + fn) else 0.0

NM = {"wu": "Detektor Pola Wu", "cost": "Aturan rasio biaya perkiraan", "lr": "Regresi logistik",
      "m1": "XGBoost Struktur Plan", "m2b": "XGBoost Kardinalitas Lokal", "rf": "Random forest", "ens": "Gabungan peringkat"}

def direction(tr, te):
    y_tr = tr[LAB].astype(int).to_numpy(); y = te[LAB].astype(int).to_numpy()
    out = {"y": y, "p0": te["m0_prediction"].astype(int).to_numpy(), "prob": {}, "lat_ms": {}, "te": te}
    specs = [("m1", xgb, M1_COLS, False), ("m2b", xgb, ALL_COLS, False), ("rf", rforest, ALL_COLS, False),
             ("lr", logreg, ALL_COLS, True)]
    for key, builder, cols, use_log in specs:
        Xtr, Xte = prep(tr, cols), prep(te, cols)
        if use_log: Xtr, Xte = slog(Xtr), slog(Xte)
        acc = np.zeros(len(te)); t_pred = 0.0
        seeds = SEEDS if key != "lr" else [42]
        for s in seeds:
            m = builder(y_tr, s); m.fit(Xtr, y_tr)
            t0 = time.perf_counter(); acc += m.predict_proba(Xte)[:, 1]; t_pred += time.perf_counter() - t0
        out["prob"][key] = acc / len(seeds); out["lat_ms"][key] = 1000 * (t_pred / len(seeds)) / len(te)
    out["prob"]["cost"] = te["estimated_cost_ratio"].replace([np.inf, -np.inf], np.nan).fillna(0).to_numpy(); out["lat_ms"]["cost"] = 0.0
    out["prob"]["ens"] = (rank01(out["prob"]["m1"]) + rank01(out["prob"]["m2b"]) + rank01(out["prob"]["rf"])) / 3.0
    out["lat_ms"]["ens"] = out["lat_ms"]["m1"] + out["lat_ms"]["m2b"] + out["lat_ms"]["rf"]
    out["k"] = int(out["p0"].sum())
    return out

t0 = time.time()
D1 = direction(old, new); D2 = direction(new, old)
print(f"Dua arah selesai ({time.time() - t0:.0f} dtk)")
y_all = np.concatenate([D1["y"], D2["y"]])
KEYS = ["cost", "lr", "m1", "m2b", "rf", "ens"]
def pooled_pred(key, Ds=(D1, D2)):
    if key == "wu": return np.concatenate([D["p0"] for D in Ds])
    return np.concatenate([topk(D["prob"][key], D["k"]) for D in Ds])

# ---------- 1. TABEL METRIK LENGKAP ----------
rows = []
for key in ["wu"] + KEYS:
    p = pooled_pred(key)
    tp = int(((y_all == 1) & (p == 1)).sum()); fp = int(((y_all == 0) & (p == 1)).sum())
    fn = int(((y_all == 1) & (p == 0)).sum()); tn = int(((y_all == 0) & (p == 0)).sum())
    f1p = f1_of(tp, fp, fn); f1n = f1_of(tn, fn, fp)
    r = {"model": NM[key], "TP": tp, "FP": fp, "FN": fn, "TN": tn, "Akurasi": (tp + tn) / len(y_all),
         "Precision": tp / max(tp + fp, 1), "Recall": tp / max(tp + fn, 1), "F1_Regression": f1p, "Macro_F1": (f1p + f1n) / 2}
    if key != "wu":
        pa = [average_precision_score(D["y"], D["prob"][key]) for D in (D1, D2)]
        ra = [roc_auc_score(D["y"], D["prob"][key]) for D in (D1, D2)]
        r.update(PR_AUC=float(np.mean(pa)), ROC_AUC=float(np.mean(ra)),
                 Latensi_ms=float(np.mean([D1["lat_ms"][key], D2["lat_ms"][key]])))
    rows.append(r)
tab = pd.DataFrame(rows)
pd.set_option("display.width", 250); pd.set_option("display.max_columns", 30)
print("\n=== 1. TABEL METRIK LENGKAP (gabungan dua arah, anggaran tanda sama dengan Detektor Pola Wu) ===")
print(tab.round(3).to_string(index=False))
tab.to_csv(OUT / "tabel_metrik_lengkap.csv", index=False)

# ---------- 2. SHAP ----------
def pretty(c):
    for pre, nm in [("before_", "Plan sebelum: "), ("candidate_", "Plan kandidat: "), ("delta_", "Selisih: "),
                    ("ce_", "CE plan: "), ("loc_", "CE berubah: ")]:
        if c.startswith(pre): return nm + c[len(pre):].replace("_", " ")
    return "Rasio biaya perkiraan" if c == "estimated_cost_ratio" else c.replace("_", " ")
def family(c):
    for pre, nm in [("before_", "Plan sebelum indeks"), ("candidate_", "Plan kandidat"), ("delta_", "Selisih plan"),
                    ("ce_", "CE seluruh plan"), ("loc_", "CE operator berubah")]:
        if c.startswith(pre): return nm
    return "Rasio biaya perkiraan"

print("\n=== 2. SHAP (TreeSHAP, XGBoost Kardinalitas Lokal) ===")
try:
    sv_list, X_list = [], []
    for tr, te in [(old, new), (new, old)]:
        y_tr = tr[LAB].astype(int).to_numpy(); Xtr, Xte = prep(tr, ALL_COLS), prep(te, ALL_COLS)
        acc = np.zeros((len(te), len(ALL_COLS)))
        for s in SEEDS:
            m = xgb(y_tr, s); m.fit(Xtr, y_tr)
            contrib = m.get_booster().predict(xgb_lib.DMatrix(Xte, feature_names=list(ALL_COLS)), pred_contribs=True)
            acc += contrib[:, :-1] / len(SEEDS)           # kolom terakhir = bias
        sv_list.append(acc); X_list.append(Xte)
    SV = np.vstack(sv_list); XX = pd.concat(X_list, ignore_index=True)
    mean_abs = pd.Series(np.abs(SV).mean(axis=0), index=ALL_COLS).sort_values(ascending=False)
    fam_abs = mean_abs.groupby([family(c) for c in mean_abs.index]).sum().sort_values(ascending=False)
    print("Rata-rata |SHAP| per kelompok (porsi):"); print((fam_abs / fam_abs.sum()).round(3).to_string())
    print("15 variabel teratas (rata-rata |SHAP|, satuan log-odds):"); print(mean_abs.head(15).round(4).to_string())
    pd.DataFrame({"variabel": mean_abs.index, "mean_abs_shap": mean_abs.values, "kelompok": [family(c) for c in mean_abs.index]}
                 ).to_csv(OUT / "shap_rata_abs.csv", index=False)
    # arah efek: korelasi nilai variabel dengan SHAP-nya (tanda sederhana)
    tops = list(mean_abs.head(15).index)
    arah = {}
    for c in tops:
        j = ALL_COLS.index(c)
        cc = np.corrcoef(rank01(XX[c].to_numpy()), SV[:, j])[0, 1] if XX[c].nunique() > 1 else np.nan
        arah[c] = round(float(cc), 2)
    print("Korelasi nilai variabel dengan SHAP (positif = nilai makin besar, risiko makin naik):"); print(pd.Series(arah).to_string())
    # beeswarm
    try:
        import shap
        names = [pretty(c) for c in ALL_COLS]
        plt.figure(figsize=(7.6, 5.4))
        shap.summary_plot(SV, XX.values, feature_names=names, max_display=15, show=False, plot_size=None)
        plt.xlabel("Nilai SHAP (dampak pada log-odds Regression)", fontsize=9)
        plt.tight_layout(); plt.savefig(OUT / "gambar_shap_summary.png", dpi=220, facecolor="white"); plt.close()
    except Exception as e:
        print("shap.summary_plot gagal, memakai beeswarm sederhana:", repr(e)[:120])
        fig, ax = plt.subplots(figsize=(7.6, 5.4)); rng = np.random.RandomState(0)
        for i, c in enumerate(tops[::-1]):
            j = ALL_COLS.index(c); r = rank01(XX[c].to_numpy())
            ax.scatter(SV[:, j], i + rng.uniform(-0.25, 0.25, len(r)), c=r, cmap="coolwarm", s=7)
        ax.set_yticks(range(len(tops))); ax.set_yticklabels([pretty(c) for c in tops[::-1]], fontsize=8)
        ax.set_xlabel("Nilai SHAP (dampak pada log-odds Regression)"); ax.axvline(0, color="#999", lw=0.8)
        fig.tight_layout(); fig.savefig(OUT / "gambar_shap_summary.png", dpi=220, facecolor="white"); plt.close(fig)
    fig, axes = plt.subplots(1, 2, figsize=(10.2, 4.0), gridspec_kw={"width_ratios": [1.25, 1]})
    top = mean_abs.head(12)[::-1]
    axes[0].barh([pretty(c) for c in top.index], top.values, color="#E0662F")
    axes[0].set_title("12 variabel teratas (rata-rata |SHAP|)", fontsize=10, loc="left"); axes[0].tick_params(labelsize=8)
    fm = (fam_abs / fam_abs.sum())[::-1]
    axes[1].barh(fm.index, fm.values * 100, color="#4C78A8"); axes[1].set_title("Porsi |SHAP| per kelompok variabel (%)", fontsize=10, loc="left")
    axes[1].tick_params(labelsize=8)
    for a in axes: a.grid(axis="x", color="#e5e7eb"); a.set_axisbelow(True)
    fig.tight_layout(); fig.savefig(OUT / "gambar_shap_batang.png", dpi=220, facecolor="white"); plt.close(fig)
    shap_ok = True
except Exception as e:
    shap_ok = False; print("SHAP GAGAL:", repr(e)[:300])

# ---------- 3. ANALISIS KESALAHAN ----------
print("\n=== 3. ANALISIS KESALAHAN (Gabungan peringkat vs Detektor Pola Wu, dua arah digabung, anggaran sama) ===")
parts = []
for dname, D in [("lama->baru", D1), ("baru->lama", D2)]:
    te = D["te"]; flag_ens = topk(D["prob"]["ens"], D["k"])
    parts.append(pd.DataFrame({"sample_id": te["sample_id"].to_numpy(), "template_id": te["template_id"].astype(str).to_numpy(),
                               "arah": dname, "label": D["y"], "rasio_waktu": te["ratio"].to_numpy(),
                               "wu_tandai": D["p0"], "ens_tandai": flag_ens,
                               "ens_skor": D["prob"]["ens"], "ens_peringkat": (-D["prob"]["ens"]).argsort().argsort() + 1,
                               "rasio_biaya_perkiraan": te["estimated_cost_ratio"].to_numpy()}))
E = pd.concat(parts, ignore_index=True)
E.to_csv(OUT / "analisis_kesalahan_per_transisi.csv", index=False)
reg = E[E.label == 1]; nor = E[E.label == 0]
print("Tumpang tindih pada transisi Regression nyata (n=%d):" % len(reg))
print(f"  ditemukan keduanya {int(((reg.wu_tandai==1)&(reg.ens_tandai==1)).sum())}, hanya Wu {int(((reg.wu_tandai==1)&(reg.ens_tandai==0)).sum())}, "
      f"hanya Gabungan {int(((reg.wu_tandai==0)&(reg.ens_tandai==1)).sum())}, tidak ada yang menemukan {int(((reg.wu_tandai==0)&(reg.ens_tandai==0)).sum())}")
print("Tumpang tindih pada alarm palsu: Wu %d, Gabungan %d, keduanya %d" % (
    int((nor.wu_tandai==1).sum()), int((nor.ens_tandai==1).sum()), int(((nor.wu_tandai==1)&(nor.ens_tandai==1)).sum())))
have_ratio = E.rasio_waktu.notna().any()
if have_ratio:
    bins = [0, 1.0, 1.2, 1.5, 2, 3, 5, np.inf]; lab = ["<1,0", "1,0-1,2", "1,2-1,5", "1,5-2", "2-3", "3-5", ">=5"]
    E["bin_rasio"] = pd.cut(E.rasio_waktu, bins=bins, labels=lab, right=False)
    g = E.groupby("bin_rasio", observed=True).agg(n=("label", "size"), regression=("label", "sum"),
                                                  wu_tandai=("wu_tandai", "sum"), gabungan_tandai=("ens_tandai", "sum"))
    print("\nTransisi per pita rasio waktu (rasio = sesudah/sebelum; Regression = rasio >= 1,5):"); print(g.to_string())
    print("Catatan: pita 1,2-1,5 dan 1,5-2 adalah daerah batas; label berasal dari median jalan berulang, rasio di sini bisa berbeda tipis.")
    g.to_csv(OUT / "analisis_kesalahan_pita_rasio.csv")
tmpl = E.groupby("template_id").apply(lambda d: pd.Series({
    "n": len(d), "regression": int(d.label.sum()),
    "TP_wu": int(((d.label==1)&(d.wu_tandai==1)).sum()), "TP_gab": int(((d.label==1)&(d.ens_tandai==1)).sum()),
    "FP_wu": int(((d.label==0)&(d.wu_tandai==1)).sum()), "FP_gab": int(((d.label==0)&(d.ens_tandai==1)).sum())}))
tmpl = tmpl.sort_values("regression", ascending=False)
print("\nPer template (10 teratas menurut jumlah Regression):"); print(tmpl.head(10).to_string())
tmpl.to_csv(OUT / "analisis_kesalahan_per_template.csv")
fn = reg[reg.ens_tandai == 0].sort_values("ens_peringkat", ascending=False)
fp = nor[nor.ens_tandai == 1].sort_values("ens_peringkat")
cols_show = ["template_id", "arah", "rasio_waktu", "wu_tandai", "ens_peringkat", "rasio_biaya_perkiraan"]
print("\nFalse Negative Gabungan (Regression yang lolos), 10 paling jauh dari daftar tandai:"); print(fn[cols_show].head(10).round(2).to_string(index=False))
print("False Positive Gabungan (alarm palsu), 10 skor tertinggi:"); print(fp[cols_show].head(10).round(2).to_string(index=False))
if have_ratio:
    fpr = fp.rasio_waktu.dropna(); fnr = fn.rasio_waktu.dropna()
    if len(fpr): print(f"Alarm palsu Gabungan: {len(fpr)}; rasio >=1,2 (dekat ambang) {int((fpr>=1.2).sum())}; rasio <1,0 (benar-benar tidak melambat) {int((fpr<1.0).sum())}")
    if len(fnr): print(f"Regression lolos Gabungan: {len(fnr)}; rasio 1,5-2 (dekat ambang) {int(((fnr>=1.5)&(fnr<2)).sum())}; rasio >=3 {int((fnr>=3).sum())}")

# ---------- 4. OPTUNA TANPA KEBOCORAN ----------
print(f"\n=== 4. TUNING OPTUNA ({N_TRIALS} percobaan, validasi silang per template di dalam data latih saja) ===")
import optuna
optuna.logging.set_verbosity(optuna.logging.WARNING)
def cv_score(tr, params):
    y = tr[LAB].astype(int).to_numpy(); X = prep(tr, ALL_COLS); g = tr["template_id"].astype(str).to_numpy()
    sc = []
    for a, b in StratifiedGroupKFold(n_splits=3, shuffle=True, random_state=42).split(X, y, g):
        if y[b].sum() == 0 or y[a].sum() == 0: continue
        m = xgb(y[a], 42, **params); m.fit(X.iloc[a], y[a])
        sc.append(average_precision_score(y[b], m.predict_proba(X.iloc[b])[:, 1]))
    return float(np.mean(sc)) if sc else 0.0
def tune(tr):
    def obj(trial):
        pr = dict(n_estimators=trial.suggest_int("n_estimators", 100, 400, step=50),
                  learning_rate=trial.suggest_float("learning_rate", 0.01, 0.2, log=True),
                  max_depth=trial.suggest_int("max_depth", 2, 6),
                  min_child_weight=trial.suggest_int("min_child_weight", 1, 10),
                  subsample=trial.suggest_float("subsample", 0.5, 1.0),
                  colsample_bytree=trial.suggest_float("colsample_bytree", 0.5, 1.0),
                  reg_lambda=trial.suggest_float("reg_lambda", 0.1, 10.0, log=True),
                  gamma=trial.suggest_float("gamma", 0.0, 5.0))
        return cv_score(tr, pr)
    st = optuna.create_study(direction="maximize", sampler=optuna.samplers.TPESampler(seed=42))
    st.optimize(obj, n_trials=N_TRIALS, show_progress_bar=False)
    return st
res = []; best_all = {}; hist_all = {}
for dname, tr, te, D in [("lama->baru", old, new, D1), ("baru->lama", new, old, D2)]:
    t0 = time.time(); st = tune(tr); bp = st.best_params
    base_cv = cv_score(tr, {})
    y_tr = tr[LAB].astype(int).to_numpy(); Xtr, Xte = prep(tr, ALL_COLS), prep(te, ALL_COLS); y = te[LAB].astype(int).to_numpy()
    pt = np.zeros(len(te)); t_pred = 0.0
    for s in SEEDS:
        m = xgb(y_tr, s, **bp); m.fit(Xtr, y_tr)
        t1 = time.perf_counter(); pt += m.predict_proba(Xte)[:, 1] / len(SEEDS); t_pred += time.perf_counter() - t1
    best_all[dname] = {"params": bp, "cv_pr_auc_tuned": st.best_value, "cv_pr_auc_default": base_cv}
    hist_all[dname] = [t.value for t in st.trials]
    D["prob"]["m2b_tuned"] = pt
    print(f"[{dname}] PR-AUC validasi silang: bawaan {base_cv:.3f} -> terbaik {st.best_value:.3f} ({time.time()-t0:.0f} dtk); parameter: "
          + ", ".join(f"{k}={v:.3g}" if isinstance(v, float) else f"{k}={v}" for k, v in bp.items()))
cmp_rows = []
for key, nm in [("m2b", "XGBoost Kardinalitas Lokal (bawaan)"), ("m2b_tuned", "XGBoost Kardinalitas Lokal (Optuna)")]:
    p = np.concatenate([topk(D["prob"][key], D["k"]) for D in (D1, D2)])
    tp = int(((y_all == 1) & (p == 1)).sum()); fp_ = int(((y_all == 0) & (p == 1)).sum()); fn_ = int(((y_all == 1) & (p == 0)).sum())
    tn = int(((y_all == 0) & (p == 0)).sum()); f1p = f1_of(tp, fp_, fn_); f1n = f1_of(tn, fn_, fp_)
    cmp_rows.append({"model": nm, "TP": tp, "FP": fp_, "FN": fn_, "TN": tn, "Precision": tp / max(tp + fp_, 1), "Recall": tp / max(tp + fn_, 1),
                     "F1": f1p, "Macro_F1": (f1p + f1n) / 2,
                     "PR_AUC_arah1": average_precision_score(D1["y"], D1["prob"][key]),
                     "PR_AUC_arah2": average_precision_score(D2["y"], D2["prob"][key]),
                     "ROC_AUC_arah1": roc_auc_score(D1["y"], D1["prob"][key]), "ROC_AUC_arah2": roc_auc_score(D2["y"], D2["prob"][key])})
cmp_ = pd.DataFrame(cmp_rows); print("\nPerbandingan di data uji sisi lain (tanpa kebocoran):"); print(cmp_.round(3).to_string(index=False))
cmp_.to_csv(OUT / "perbandingan_optuna.csv", index=False)
fig, ax = plt.subplots(figsize=(5.6, 3.5))
for dname, c in zip(hist_all, ["#4C78A8", "#E0662F"]):
    h = np.array(hist_all[dname]); ax.plot(np.arange(1, len(h) + 1), np.maximum.accumulate(h), color=c, lw=1.8, label=f"Arah {dname}")
ax.set_xlabel("Percobaan Optuna"); ax.set_ylabel("PR-AUC validasi silang terbaik"); ax.grid(color="#e5e7eb"); ax.legend(fontsize=8)
fig.tight_layout(); fig.savefig(OUT / "gambar_optuna_riwayat.png", dpi=220, facecolor="white"); plt.close(fig)

with open(OUT / "ringkasan_analisis.json", "w") as f:
    json.dump({"tabel": tab.round(4).to_dict(orient="records"), "optuna": best_all, "perbandingan_optuna": cmp_.round(4).to_dict(orient="records"),
               "shap_top15": (mean_abs.head(15).round(4).to_dict() if shap_ok else None),
               "shap_kelompok": ((fam_abs / fam_abs.sum()).round(4).to_dict() if shap_ok else None)}, f, indent=1, ensure_ascii=False, default=str)
print("\nTersimpan di:", OUT); print(sorted(p.name for p in OUT.glob("*")))
