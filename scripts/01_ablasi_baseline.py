# ============================================================
# ABLASI FORMAL + BASELINE TAMBAHAN  (latih di data LAMA, uji di data BARU seed 2026)
# ------------------------------------------------------------
# Tujuan: menjawab dua pertanyaan evaluasi.
#  (1) Bagian variabel mana yang membuat M2b lebih baik?  -> ablasi M1, M2, M1+loc, M2b
#  (2) Apakah XGBoost memang perlu?                        -> logistic regression, random forest, aturan biaya
#
# ATURAN (ditulis sebelum melihat hasil):
#  - Semua model dilatih HANYA di data lama. Pengaturan tetap, tanpa tuning. Data baru dipakai untuk menguji.
#  - Perbandingan utama memakai ANGGARAN SAMA (top-k, k = jumlah tanda M0), jadi tidak bergantung pada threshold.
#  - Metrik utama: F1 pada anggaran sama; selisih terhadap M0 dan antar tahap ablasi dengan CI 95% bootstrap per template.
#  - Label utama v2; label v1 hanya pelengkap.
#  - Ini analisis DESKRIPTIF pada batch 2026 yang sudah pernah dilihat. Bukan uji konfirmasi.
#  - Cell ini menolak membaca batch confirm2027 sebelum uji konfirmasinya selesai (supaya tidak "mengintip").
# ============================================================
from pathlib import Path
import numpy as np
import pandas as pd
from xgboost import XGBClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler, FunctionTransformer
from sklearn.model_selection import StratifiedGroupKFold
from sklearn.metrics import (average_precision_score, roc_auc_score, f1_score, precision_score,
                             recall_score, matthews_corrcoef)

DRIVE_ROOT = Path("/content/drive/MyDrive/QPR_SF10_Research")
OLD_ROOT = DRIVE_ROOT / "incremental"
NEW_ROOT = INCREMENTAL_ROOT if "INCREMENTAL_ROOT" in globals() and "fresh" in str(INCREMENTAL_ROOT) \
    else DRIVE_ROOT / "fresh" / "incremental_fresh"
if "confirm2027" in str(NEW_ROOT):
    assert (DRIVE_ROOT / "confirm2027" / "confirm2027_RESULT.json").exists(), \
        "Uji konfirmasi 2027 belum selesai. Jangan jalankan analisis ini di batch 2027 sebelum itu."
OLD_FEAT = OLD_ROOT / "incremental_m0_m2b_features.csv"
OLD_V2 = OLD_ROOT / "remeasure" / "remeasure_labels_v2.csv"
NEW_FEAT = NEW_ROOT / "incremental_m0_m2b_features.csv"
NEW_V2 = NEW_ROOT / "remeasure" / "remeasure_labels_v2.csv"
OUT_CSV = NEW_ROOT / "remeasure" / "ablasi_baseline_hasil.csv"
SEEDS = [42, 43, 44, 45, 46]
N_BOOT, BOOT_SEED = 2000, 2026
for p in [OLD_FEAT, OLD_V2, NEW_FEAT, NEW_V2]:
    assert p.exists(), f"File tidak ditemukan: {p}"

old = pd.read_csv(OLD_FEAT).merge(pd.read_csv(OLD_V2)[["sample_id", "label_v1", "label_v2"]], on="sample_id", how="inner")
new = pd.read_csv(NEW_FEAT)
new["label_v1"] = new["label"].astype(int)
new = new.merge(pd.read_csv(NEW_V2)[["sample_id", "label_v2"]], on="sample_id", how="left")

forbidden = {"before_elapsed_ms", "after_elapsed_ms", "runtime_ratio", "label",
             "label_v1", "label_v2", "kepastian_v2", "label_v1_file"}
def cols_with(prefixes, exact=()):
    return [c for c in old.columns if c not in forbidden and not c.startswith("m0_") and "elapsed_ms" not in c
            and (c.startswith(tuple(prefixes)) or c in exact) and pd.api.types.is_numeric_dtype(old[c])]
BASE = ["before_", "candidate_", "delta_"]
GROUPS = {
    "M1  (bentuk plan saja)":                 cols_with(BASE, ("estimated_cost_ratio",)),
    "M2  (M1 + CE seluruh plan)":             cols_with(BASE + ["ce_"], ("estimated_cost_ratio",)),
    "M1+loc (M1 + CE bagian berubah)":        cols_with(BASE + ["loc_"], ("estimated_cost_ratio",)),
    "M2b (M1 + CE seluruh + CE berubah)":     cols_with(BASE + ["ce_", "loc_"], ("estimated_cost_ratio",)),
}
ALL = GROUPS["M2b (M1 + CE seluruh + CE berubah)"]
assert all(c in new.columns for c in ALL), "Ada fitur yang tidak ada di data baru"
print("Jumlah fitur per model:", {k: len(v) for k, v in GROUPS.items()})
assert len(ALL) == len(cols_with(BASE + ["ce_", "loc_"], ("estimated_cost_ratio",)))

def prep(d, cols):
    return d[cols].replace([np.inf, -np.inf], np.nan).fillna(0.0).reset_index(drop=True)

def xgb(y, seed):
    pos = int((y == 1).sum()); neg = int((y == 0).sum())
    return XGBClassifier(objective="binary:logistic", n_estimators=200, learning_rate=0.05, max_depth=3,
                         min_child_weight=1, subsample=0.8, colsample_bytree=0.8, reg_lambda=2.0, reg_alpha=0.0,
                         scale_pos_weight=neg / max(pos, 1), eval_metric="logloss", tree_method="hist",
                         n_jobs=2, random_state=seed, verbosity=0)
def logreg(y, seed):
    slog = FunctionTransformer(lambda a: np.sign(a) * np.log1p(np.abs(a)))
    return make_pipeline(slog, StandardScaler(), LogisticRegression(C=0.1, class_weight="balanced", max_iter=3000))
def rforest(y, seed):
    return RandomForestClassifier(n_estimators=300, max_depth=5, min_samples_leaf=2, class_weight="balanced_subsample",
                                  n_jobs=2, random_state=seed)

MODELS = [(k, v, xgb) for k, v in GROUPS.items()] + [
    ("LogReg (semua fitur)", ALL, logreg), ("RandomForest (semua fitur)", ALL, rforest)]

def f1_fast(y, p):
    tp = int(((y == 1) & (p == 1)).sum()); fp = int(((y == 0) & (p == 1)).sum()); fn = int(((y == 1) & (p == 0)).sum())
    return 2 * tp / (2 * tp + fp + fn) if (2 * tp + fp + fn) else 0.0

def topk(prob, k):
    p = np.zeros(len(prob), dtype=int); p[np.argsort(-prob, kind="stable")[:k]] = 1; return p

def pick_threshold(builder, X, y, g):
    k = min(3, max(len(set(g[y == 1])), 2))
    inner = StratifiedGroupKFold(n_splits=k, shuffle=True, random_state=123)
    prob = np.zeros(len(y))
    for tr, va in inner.split(X, y, g):
        if len(set(y[tr])) < 2: continue
        m = builder(y[tr], 42); m.fit(X.iloc[tr], y[tr]); prob[va] = m.predict_proba(X.iloc[va])[:, 1]
    best, bt = None, 0.5
    for t in np.linspace(0.05, 0.90, 86):
        p = (prob >= t).astype(int)
        s = (f1_score(y, p, zero_division=0), matthews_corrcoef(y, p), recall_score(y, p, zero_division=0),
             precision_score(y, p, zero_division=0))
        if best is None or s > best: best, bt = s, float(t)
    return bt

def boot_f1(y, preds, groups):
    """satu set resample per template dipakai untuk semua model -> perbandingan berpasangan yang adil"""
    rng = np.random.default_rng(BOOT_SEED)
    ug = np.unique(groups); idx = {g: np.where(groups == g)[0] for g in ug}
    out = {k: [] for k in preds}
    for _ in range(N_BOOT):
        ii = np.concatenate([idx[g] for g in rng.choice(ug, len(ug), replace=True)])
        for k, p in preds.items(): out[k].append(f1_fast(y[ii], p[ii]))
    return {k: np.array(v) for k, v in out.items()}

def dci(b, a, c):  # selisih F1 (a minus c) beserta CI 95%
    d = b[a] - b[c]; return float(np.percentile(d, 2.5)), float(np.percentile(d, 97.5))

all_rows = []
for lab, tr_lab in [("label_v2", "label_v2"), ("label_v1", "label_v1")]:
    y_tr = old[tr_lab].astype(int).to_numpy(); g_old = old["template_id"].astype(str).to_numpy()
    valid = new[lab].notna().to_numpy()
    d = new.loc[valid].reset_index(drop=True)
    y = d[lab].astype(int).to_numpy(); g = d["template_id"].astype(str).to_numpy(); p0 = d["m0_prediction"].astype(int).to_numpy()
    k = int(p0.sum()); n = len(y)
    print("\n" + "=" * 78)
    print(f"LABEL UJI {lab} | n={n} | Regression={int(y.sum())} | M0 menandai k={k}")
    print("=" * 78)
    if y.sum() < 3 or k == 0:
        print("  Data tidak cukup."); continue

    preds_mb, probs, seed_f1 = {"M0 (Wu)": p0}, {}, {}
    for name, cols, builder in MODELS:
        Xo, Xn = prep(old, cols), prep(d, cols)
        fs = []
        for s in SEEDS:
            m = builder(y_tr, s); m.fit(Xo, y_tr); pr = m.predict_proba(Xn)[:, 1]
            if s == SEEDS[0]: probs[name] = pr; preds_mb[name] = topk(pr, k)
            fs.append(f1_fast(y, topk(pr, k)))
            if builder is logreg: break              # LogReg tidak acak
        seed_f1[name] = fs
    # aturan sederhana: urutkan menurut estimated_cost_ratio (makin besar makin berisiko)
    if "estimated_cost_ratio" in d.columns:
        sc = d["estimated_cost_ratio"].replace([np.inf, -np.inf], np.nan).fillna(0).to_numpy()
        probs["Aturan: estimated_cost_ratio"] = sc; preds_mb["Aturan: estimated_cost_ratio"] = topk(sc, k)
        seed_f1["Aturan: estimated_cost_ratio"] = [f1_fast(y, preds_mb["Aturan: estimated_cost_ratio"])]
    bt = boot_f1(y, preds_mb, g)

    print(f"\nA. ANGGARAN SAMA (top-{k}, tanpa threshold)")
    print(f"{'Model':40s} {'TP':>3s} {'FP':>4s} {'Prec':>6s} {'Rec':>6s} {'F1':>6s} {'F1 5 seed':>16s}  selisih F1 vs M0 [CI 95%]   PR-AUC ROC-AUC")
    for name, p in preds_mb.items():
        tp = int(((y == 1) & (p == 1)).sum()); fp = int(((y == 0) & (p == 1)).sum())
        f1v = f1_fast(y, p); sf = seed_f1.get(name, [f1v])
        if name == "M0 (Wu)":
            print(f"{name:40s} {tp:3d} {fp:4d} {tp / max(int(p.sum()), 1):6.3f} {tp / y.sum():6.3f} {f1v:6.3f} {'-':>16s}  {'(pembanding)':>26s}"); continue
        lo, hi = dci(bt, name, "M0 (Wu)")
        pa = average_precision_score(y, probs[name]); ra = roc_auc_score(y, probs[name])
        print(f"{name:40s} {tp:3d} {fp:4d} {tp / max(int(p.sum()), 1):6.3f} {tp / y.sum():6.3f} {f1v:6.3f} "
              f"{np.mean(sf):6.3f}±{np.std(sf):5.3f}   {f1v - f1_fast(y, p0):+.3f} [{lo:+.3f},{hi:+.3f}]  {pa:6.3f} {ra:7.3f}")
        all_rows.append({"label": lab, "analisis": "anggaran_sama", "model": name, "k": k, "TP": tp, "FP": fp,
                         "F1": f1v, "F1_seed_mean": float(np.mean(sf)), "dF1_vs_M0": f1v - f1_fast(y, p0),
                         "CI_low": lo, "CI_high": hi, "PR_AUC": pa, "ROC_AUC": ra})

    full = "M2b (M1 + CE seluruh + CE berubah)"
    print("\nB. KONTRAS ABLASI (anggaran sama): apa yang ditambah M2b dibanding tahap sebelumnya")
    for other in ["M1  (bentuk plan saja)", "M2  (M1 + CE seluruh plan)", "M1+loc (M1 + CE bagian berubah)",
                  "LogReg (semua fitur)", "RandomForest (semua fitur)"]:
        lo, hi = dci(bt, full, other)
        print(f"  M2b - {other:36s} = {f1_fast(y, preds_mb[full]) - f1_fast(y, preds_mb[other]):+.3f}  [{lo:+.3f}, {hi:+.3f}]"
              f"{'   <- CI tidak memuat 0' if lo > 0 or hi < 0 else ''}")
        all_rows.append({"label": lab, "analisis": "kontras", "model": f"M2b - {other}",
                         "dF1_vs_M0": f1_fast(y, preds_mb[full]) - f1_fast(y, preds_mb[other]), "CI_low": lo, "CI_high": hi})

    print("\nC. PAKAI THRESHOLD (dipilih hanya dari data lama, CV bersarang) - sama seperti evaluasi terkunci")
    print(f"{'Model':40s} {'thr':>5s} {'ditandai':>8s} {'TP':>3s} {'FP':>4s} {'Prec':>6s} {'Rec':>6s} {'F1':>6s} {'selisih vs M0':>14s}")
    f0 = f1_fast(y, p0)
    print(f"{'M0 (Wu)':40s} {'-':>5s} {k:8d} {int(((y == 1) & (p0 == 1)).sum()):3d} {int(((y == 0) & (p0 == 1)).sum()):4d} "
          f"{precision_score(y, p0, zero_division=0):6.3f} {recall_score(y, p0, zero_division=0):6.3f} {f0:6.3f}")
    for name, cols, builder in MODELS:
        Xo, Xn = prep(old, cols), prep(d, cols)
        thr = pick_threshold(builder, Xo, y_tr, g_old)
        p = (probs[name] >= thr).astype(int)
        tp = int(((y == 1) & (p == 1)).sum()); fp = int(((y == 0) & (p == 1)).sum())
        print(f"{name:40s} {thr:5.2f} {int(p.sum()):8d} {tp:3d} {fp:4d} {precision_score(y, p, zero_division=0):6.3f} "
              f"{recall_score(y, p, zero_division=0):6.3f} {f1_fast(y, p):6.3f} {f1_fast(y, p) - f0:+14.3f}")
        all_rows.append({"label": lab, "analisis": "threshold", "model": name, "k": int(p.sum()), "TP": tp, "FP": fp,
                         "F1": f1_fast(y, p), "dF1_vs_M0": f1_fast(y, p) - f0})

OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
pd.DataFrame(all_rows).to_csv(OUT_CSV, index=False)
print("\nTersimpan:", OUT_CSV)
print("\nCARA BACA:")
print("  - Bagian A menjawab 'apakah XGBoost perlu?': kalau LogReg/RandomForest/aturan biaya sama bagusnya, laporkan apa adanya.")
print("  - Bagian B menjawab 'variabel mana yang berperan?': M2b - M1+loc dan M2b - M2 menunjukkan nilai tambah CE berubah vs CE seluruh plan.")
print("  - CI yang memuat 0 = indikasi saja. Ini batch 2026 yang sudah pernah dilihat; konfirmasi tetap dari uji seed 2027.")
