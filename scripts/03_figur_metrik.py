# ============================================================
# FIGUR DAN METRIK TAMBAHAN UNTUK MANUSKRIP
# ------------------------------------------------------------
# Menghasilkan (tanpa tuning, pengaturan sama dengan ablasi dan uji dua arah):
#  1. Tabel metrik multi-dimensi: Precision, Recall, F1, PR-AUC, ROC-AUC, Brier Score, latensi
#  2. Kurva Precision-Recall (arah 1: latih LAMA uji BARU, dan arah 2: sebaliknya)
#  3. Confusion matrix (Detektor Pola Wu vs Gabungan peringkat, gabungan dua arah, anggaran sama)
#  4. Pentingnya variabel XGBoost (gain per variabel dan per kelompok variabel)
#  5. Kurva konvergensi XGBoost (log-loss latih vs validasi, validasi = pecahan template data lama)
# Semua figur disimpan ke Drive: QPR_SF10_Research/artikel_gambar/ , tabelnya ke metrik_tambahan.csv
# Label utama: label_v2. Cell ini menolak dijalankan pada batch konfirmasi.
# ============================================================
import os, time, json
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
from xgboost import XGBClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import (average_precision_score, roc_auc_score, brier_score_loss, precision_recall_curve,
                             confusion_matrix)
from sklearn.model_selection import GroupShuffleSplit
from scipy.stats import rankdata

DRIVE_ROOT = Path(os.environ.get("QPR_ROOT", "/content/drive/MyDrive/QPR_SF10_Research"))
OLD_ROOT = DRIVE_ROOT / "incremental"
NEW_ROOT = DRIVE_ROOT / "fresh" / "incremental_fresh"
OUT_DIR = DRIVE_ROOT / "artikel_gambar"; OUT_DIR.mkdir(parents=True, exist_ok=True)
OLD_FEAT = OLD_ROOT / "incremental_m0_m2b_features.csv"
OLD_V2 = OLD_ROOT / "remeasure" / "remeasure_labels_v2.csv"
NEW_FEAT = NEW_ROOT / "incremental_m0_m2b_features.csv"
NEW_V2 = NEW_ROOT / "remeasure" / "remeasure_labels_v2.csv"
SEEDS = [42, 43, 44, 45, 46]
LAB = "label_v2"
for p in [OLD_FEAT, OLD_V2, NEW_FEAT, NEW_V2]:
    assert p.exists(), f"File tidak ditemukan: {p}"

old = pd.read_csv(OLD_FEAT).merge(pd.read_csv(OLD_V2)[["sample_id", "label_v1", "label_v2"]], on="sample_id", how="inner")
new = pd.read_csv(NEW_FEAT)
new["label_v1"] = new["label"].astype(int)
new = new.merge(pd.read_csv(NEW_V2)[["sample_id", "label_v2"]], on="sample_id", how="left")
old = old[old[LAB].notna()].reset_index(drop=True); new = new[new[LAB].notna()].reset_index(drop=True)

forbidden = {"before_elapsed_ms", "after_elapsed_ms", "runtime_ratio", "label", "label_v1", "label_v2", "kepastian_v2", "label_v1_file"}
def cols_with(prefixes, exact=()):
    return [c for c in old.columns if c not in forbidden and not c.startswith("m0_") and "elapsed_ms" not in c
            and (c.startswith(tuple(prefixes)) or c in exact) and pd.api.types.is_numeric_dtype(old[c])]
BASE = ["before_", "candidate_", "delta_"]
M1_COLS = cols_with(BASE, ("estimated_cost_ratio",))
ALL_COLS = cols_with(BASE + ["ce_", "loc_"], ("estimated_cost_ratio",))
assert all(c in new.columns for c in ALL_COLS)

def prep(d, cols): return d[cols].replace([np.inf, -np.inf], np.nan).fillna(0.0).reset_index(drop=True)
def xgb(y, seed, **extra):
    pos = int((y == 1).sum()); neg = int((y == 0).sum())
    return XGBClassifier(objective="binary:logistic", n_estimators=200, learning_rate=0.05, max_depth=3, min_child_weight=1,
                         subsample=0.8, colsample_bytree=0.8, reg_lambda=2.0, reg_alpha=0.0, scale_pos_weight=neg / max(pos, 1),
                         eval_metric="logloss", tree_method="hist", n_jobs=2, random_state=seed, verbosity=0, **extra)
def rforest(y, seed):
    return RandomForestClassifier(n_estimators=300, max_depth=5, min_samples_leaf=2, class_weight="balanced_subsample",
                                  n_jobs=2, random_state=seed)
def rank01(p): return (rankdata(p) - 1) / max(len(p) - 1, 1)
def topk(prob, k):
    p = np.zeros(len(prob), dtype=int); p[np.argsort(-prob, kind="stable")[:k]] = 1; return p
def f1_of(tp, fp, fn): return 2 * tp / (2 * tp + fp + fn) if (2 * tp + fp + fn) else 0.0

NM = {"wu": "Detektor Pola Wu", "m1": "XGBoost Struktur Plan", "m2b": "XGBoost Kardinalitas Lokal",
      "rf": "Random forest", "ens": "Gabungan peringkat"}

def direction(tr, te):
    y_tr = tr[LAB].astype(int).to_numpy(); y = te[LAB].astype(int).to_numpy()
    out = {"y": y, "p0": te["m0_prediction"].astype(int).to_numpy(), "prob": {}, "lat_ms": {}, "fit_s": {}}
    specs = [("m1", xgb, M1_COLS), ("m2b", xgb, ALL_COLS), ("rf", rforest, ALL_COLS)]
    for key, builder, cols in specs:
        Xtr, Xte = prep(tr, cols), prep(te, cols)
        acc = np.zeros(len(te)); t_fit = 0.0; t_pred = 0.0
        for s in SEEDS:
            t0 = time.perf_counter(); m = builder(y_tr, s); m.fit(Xtr, y_tr); t_fit += time.perf_counter() - t0
            t0 = time.perf_counter(); acc += m.predict_proba(Xte)[:, 1]; t_pred += time.perf_counter() - t0
        out["prob"][key] = acc / len(SEEDS)
        out["fit_s"][key] = t_fit / len(SEEDS); out["lat_ms"][key] = 1000 * (t_pred / len(SEEDS)) / len(te)
    out["prob"]["ens"] = (rank01(out["prob"]["m1"]) + rank01(out["prob"]["m2b"]) + rank01(out["prob"]["rf"])) / 3.0
    out["lat_ms"]["ens"] = out["lat_ms"]["m1"] + out["lat_ms"]["m2b"] + out["lat_ms"]["rf"]   # tiga model dijalankan berurutan
    out["fit_s"]["ens"] = out["fit_s"]["m1"] + out["fit_s"]["m2b"] + out["fit_s"]["rf"]
    out["k"] = int(out["p0"].sum())
    return out

D1 = direction(old, new)   # arah 1: latih LAMA, uji BARU
D2 = direction(new, old)   # arah 2: latih BARU, uji LAMA
KEYS = ["m1", "m2b", "rf", "ens"]

# ---------- 1. TABEL METRIK ----------
rows = []
y_all = np.concatenate([D1["y"], D2["y"]])
def pooled_pred(key):
    return np.concatenate([topk(D1["prob"][key], D1["k"]), topk(D2["prob"][key], D2["k"])]) if key != "wu" else np.concatenate([D1["p0"], D2["p0"]])
for key in ["wu"] + KEYS:
    p = pooled_pred(key)
    tp = int(((y_all == 1) & (p == 1)).sum()); fp = int(((y_all == 0) & (p == 1)).sum()); fn = int(((y_all == 1) & (p == 0)).sum())
    tn = int(((y_all == 0) & (p == 0)).sum())
    r = {"model": NM[key], "TP": tp, "FP": fp, "FN": fn, "TN": tn,
         "Precision": tp / max(tp + fp, 1), "Recall": tp / max(tp + fn, 1), "F1": f1_of(tp, fp, fn),
         "Akurasi": (tp + tn) / len(y_all)}
    if key != "wu":
        pa, ra, br, lat = [], [], [], []
        for D in (D1, D2):
            pa.append(average_precision_score(D["y"], D["prob"][key])); ra.append(roc_auc_score(D["y"], D["prob"][key]))
            if key != "ens": br.append(brier_score_loss(D["y"], D["prob"][key]))
        r["PR_AUC_arah1"], r["PR_AUC_arah2"] = pa; r["ROC_AUC_arah1"], r["ROC_AUC_arah2"] = ra
        r["PR_AUC_rata"], r["ROC_AUC_rata"] = float(np.mean(pa)), float(np.mean(ra))
        r["Brier_rata"] = float(np.mean(br)) if br else np.nan
        r["Latensi_ms_per_transisi"] = float(np.mean([D1["lat_ms"][key], D2["lat_ms"][key]]))
        r["Waktu_latih_detik"] = float(np.mean([D1["fit_s"][key], D2["fit_s"][key]]))
    rows.append(r)
tab = pd.DataFrame(rows)
prev = [D["y"].mean() for D in (D1, D2)]
print("Laju dasar Regression per arah:", [f"{v:.3f}" for v in prev], "| Brier acuan (selalu menebak laju dasar):",
      f"{np.mean([v * (1 - v) for v in prev]):.3f}")
pd.set_option("display.width", 250); pd.set_option("display.max_columns", 30)
print("\nTABEL METRIK (gabungan dua arah, anggaran sama per arah; AUC dan Brier dirata-rata dua arah)")
print(tab.round(3).to_string(index=False))
tab.to_csv(OUT_DIR / "metrik_tambahan.csv", index=False)
print("\nCatatan: Brier memakai probabilitas mentah. scale_pos_weight membuat probabilitas XGBoost condong tinggi, jadi Brier tinggi tidak berarti urutan risikonya buruk.")
print("Catatan: Brier untuk gabungan peringkat tidak dihitung karena skornya peringkat, bukan probabilitas.")

# ---------- 2. KURVA PRECISION-RECALL ----------
COL = {"m1": "#4C78A8", "m2b": "#E0662F", "rf": "#59A14F", "ens": "#B07AA1"}
fig, axes = plt.subplots(1, 2, figsize=(9.6, 3.9))
for ax, D, ttl in [(axes[0], D1, "Arah 1: latih data lama, uji data baru"), (axes[1], D2, "Arah 2: latih data baru, uji data lama")]:
    for key in KEYS:
        pr, rc, _ = precision_recall_curve(D["y"], D["prob"][key])
        ax.plot(rc, pr, color=COL[key], lw=1.8, label=f"{NM[key]} (PR-AUC {average_precision_score(D['y'], D['prob'][key]):.2f})")
    tp0 = int(((D["y"] == 1) & (D["p0"] == 1)).sum())
    ax.scatter([tp0 / D["y"].sum()], [tp0 / max(D["p0"].sum(), 1)], color="#222", s=55, marker="D", zorder=5, label="Detektor Pola Wu (satu titik)")
    ax.axhline(D["y"].mean(), color="#999", lw=0.9, ls=":")
    ax.set_xlim(0, 1); ax.set_ylim(0, 1.02); ax.set_xlabel("Recall"); ax.set_ylabel("Precision"); ax.set_title(ttl, fontsize=10, loc="left")
    ax.grid(color="#e5e7eb"); ax.legend(fontsize=6.8, loc="upper right")
fig.tight_layout(); fig.savefig(OUT_DIR / "gambar_pr_curve.png", dpi=220, facecolor="white"); plt.close(fig)

# ---------- 3. CONFUSION MATRIX ----------
fig, axes = plt.subplots(1, 2, figsize=(7.6, 3.5))
for ax, key in zip(axes, ["wu", "ens"]):
    p = pooled_pred(key); cm = confusion_matrix(y_all, p, labels=[0, 1])
    ax.imshow(cm, cmap="Blues")
    for i in range(2):
        for j in range(2):
            ax.text(j, i, f"{cm[i, j]}", ha="center", va="center", fontsize=13, fontweight="bold",
                    color="white" if cm[i, j] > cm.max() * 0.55 else "#1f2937")
    ax.set_xticks([0, 1]); ax.set_yticks([0, 1]); ax.set_xticklabels(["Normal", "Regression"]); ax.set_yticklabels(["Normal", "Regression"])
    ax.set_xlabel("Prediksi"); ax.set_ylabel("Label sebenarnya"); ax.set_title(NM[key], fontsize=10)
fig.tight_layout(); fig.savefig(OUT_DIR / "gambar_confusion_matrix.png", dpi=220, facecolor="white"); plt.close(fig)

# ---------- 4. PENTINGNYA VARIABEL ----------
Xo = prep(old, ALL_COLS); yo = old[LAB].astype(int).to_numpy()
imp_sum = {}
for s in SEEDS:
    m = xgb(yo, s); m.fit(Xo, yo)
    sc = m.get_booster().get_score(importance_type="gain")
    for k_, v in sc.items(): imp_sum[k_] = imp_sum.get(k_, 0.0) + v / len(SEEDS)
imp = pd.Series(imp_sum).sort_values(ascending=False)
def family(c):
    for pre, nm in [("before_", "Plan sebelum indeks"), ("candidate_", "Plan kandidat"), ("delta_", "Selisih plan"),
                    ("ce_", "CE seluruh plan"), ("loc_", "CE operator berubah")]:
        if c.startswith(pre): return nm
    return "Rasio biaya perkiraan"
fam = imp.groupby([family(c) for c in imp.index]).sum().sort_values(ascending=False)
print("\nPENTINGNYA VARIABEL (gain, rata-rata 5 seed, model dilatih di data lama)")
print("Per kelompok:"); print((fam / fam.sum()).round(3).to_string())
print("15 variabel teratas:"); print(imp.head(15).round(3).to_string())
imp.to_csv(OUT_DIR / "pentingnya_variabel_gain.csv")
fig, axes = plt.subplots(1, 2, figsize=(10.2, 4.0), gridspec_kw={"width_ratios": [1.25, 1]})
top = imp.head(12)[::-1]
axes[0].barh([c if len(c) < 34 else c[:31] + "..." for c in top.index], top.values, color="#E0662F")
axes[0].set_title("12 variabel teratas (gain)", fontsize=10, loc="left"); axes[0].tick_params(labelsize=8)
fm = (fam / fam.sum())[::-1]
axes[1].barh(fm.index, fm.values * 100, color="#4C78A8"); axes[1].set_title("Porsi gain per kelompok variabel (%)", fontsize=10, loc="left")
axes[1].tick_params(labelsize=8)
for a in axes: a.grid(axis="x", color="#e5e7eb"); a.set_axisbelow(True)
fig.tight_layout(); fig.savefig(OUT_DIR / "gambar_pentingnya_variabel.png", dpi=220, facecolor="white"); plt.close(fig)

# ---------- 5. KURVA KONVERGENSI ----------
gss = GroupShuffleSplit(n_splits=1, test_size=0.25, random_state=42)
tr_i, va_i = next(gss.split(Xo, yo, groups=old["template_id"].astype(str)))
mm = xgb(yo[tr_i], 42); mm.fit(Xo.iloc[tr_i], yo[tr_i], eval_set=[(Xo.iloc[tr_i], yo[tr_i]), (Xo.iloc[va_i], yo[va_i])], verbose=False)
ev = mm.evals_result(); tr_ll = ev["validation_0"]["logloss"]; va_ll = ev["validation_1"]["logloss"]
fig, ax = plt.subplots(figsize=(5.6, 3.5))
ax.plot(tr_ll, color="#4C78A8", lw=1.8, label="Latih"); ax.plot(va_ll, color="#E0662F", lw=1.8, label="Validasi (template terpisah)")
ax.set_xlabel("Jumlah pohon"); ax.set_ylabel("Log-loss"); ax.grid(color="#e5e7eb"); ax.legend(fontsize=8)
fig.tight_layout(); fig.savefig(OUT_DIR / "gambar_konvergensi.png", dpi=220, facecolor="white"); plt.close(fig)
print(f"\nKonvergensi: log-loss latih {tr_ll[0]:.3f} -> {tr_ll[-1]:.3f}; validasi {va_ll[0]:.3f} -> {va_ll[-1]:.3f}; "
      f"validasi terendah {min(va_ll):.3f} pada pohon ke-{int(np.argmin(va_ll)) + 1} dari {len(va_ll)}")

with open(OUT_DIR / "ringkasan_metrik.json", "w") as f:
    json.dump({"tabel": tab.round(4).to_dict(orient="records"), "gain_kelompok": (fam / fam.sum()).round(4).to_dict(),
               "gain_top15": imp.head(15).round(4).to_dict()}, f, indent=1, ensure_ascii=False)
print("\nTersimpan di:", OUT_DIR)
print(sorted(p.name for p in OUT_DIR.glob("*")))
