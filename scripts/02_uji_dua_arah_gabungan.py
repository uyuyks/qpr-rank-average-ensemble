# ============================================================
# UJI SILANG DUA ARAH + KANDIDAT PERBAIKAN  (data lama + data baru seed 2026)
# ------------------------------------------------------------
# Tujuan:
#  (1) Menambah daya uji. Evaluasi satu arah hanya memuat 30 query Regression. Di sini dua arah dipakai:
#        Arah 1: latih di data LAMA  -> uji di data BARU   (sama dengan uji terkunci)
#        Arah 2: latih di data BARU  -> uji di data LAMA   (arah sebaliknya)
#      Setiap transisi diuji oleh model yang TIDAK pernah melihatnya, jadi ~650 transisi dan jumlah Regression
#      hampir dua kali lipat. CI diambil dengan bootstrap per template pada gabungan dua arah.
#  (2) Mencoba kandidat perbaikan yang masuk akal dari hasil ablasi:
#        - Gabungan peringkat (XGBoost struktur plan + XGBoost lengkap + Random forest)
#        - XGBoost + sinyal Detektor Pola Wu sebagai satu variabel tambahan (hibrida)
#
# ATURAN (ditulis sebelum melihat hasil):
#  - KANDIDAT UTAMA yang dinilai: "Gabungan peringkat". Yang lain dilaporkan sebagai pelengkap, bukan untuk dipilih-pilih.
#  - Semua kandidat DILAPORKAN, termasuk yang jelek. Tidak ada yang disembunyikan.
#  - Pengaturan model tetap (sama dengan ablasi). Probabilitas dirata-rata dari 5 seed supaya tidak bergantung satu seed.
#  - Perbandingan memakai ANGGARAN SAMA: tiap arah dibatasi menandai sebanyak yang ditandai Detektor Pola Wu pada
#    set uji arah itu. Tidak ada threshold yang disetel.
#  - Metrik utama: selisih F1 terhadap Detektor Pola Wu, CI 95% bootstrap per template (2000 ulangan). Label utama v2.
#  - Ini analisis DESKRIPTIF pada data yang sudah pernah dilihat. Ia memperkuat atau melemahkan, bukan pembuktian akhir.
#  - Cell ini menolak dijalankan pada batch konfirmasi.
# ============================================================
import os
from pathlib import Path
import numpy as np
import pandas as pd
from xgboost import XGBClassifier
from sklearn.ensemble import RandomForestClassifier
from scipy.stats import rankdata

DRIVE_ROOT = Path(os.environ.get("QPR_ROOT", "/content/drive/MyDrive/QPR_SF10_Research"))
OLD_ROOT = DRIVE_ROOT / "incremental"
NEW_ROOT = DRIVE_ROOT / "fresh" / "incremental_fresh"
OLD_FEAT = OLD_ROOT / "incremental_m0_m2b_features.csv"
OLD_V2 = OLD_ROOT / "remeasure" / "remeasure_labels_v2.csv"
NEW_FEAT = NEW_ROOT / "incremental_m0_m2b_features.csv"
NEW_V2 = NEW_ROOT / "remeasure" / "remeasure_labels_v2.csv"
OUT_CSV = NEW_ROOT / "remeasure" / "perbaikan_gabungan_hasil.csv"
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
M1_COLS = cols_with(BASE, ("estimated_cost_ratio",))
ALL_COLS = cols_with(BASE + ["ce_", "loc_"], ("estimated_cost_ratio",))
assert "m0_prediction" in old.columns and "m0_prediction" in new.columns, "m0_prediction tidak ada"
assert all(c in new.columns for c in ALL_COLS), "Ada fitur yang tidak ada di salah satu data"
print(f"Fitur: struktur plan={len(M1_COLS)}, lengkap={len(ALL_COLS)}")

def prep(d, cols):
    X = d[cols].replace([np.inf, -np.inf], np.nan).fillna(0.0).reset_index(drop=True)
    return X

def xgb(y, seed):
    pos = int((y == 1).sum()); neg = int((y == 0).sum())
    return XGBClassifier(objective="binary:logistic", n_estimators=200, learning_rate=0.05, max_depth=3,
                         min_child_weight=1, subsample=0.8, colsample_bytree=0.8, reg_lambda=2.0, reg_alpha=0.0,
                         scale_pos_weight=neg / max(pos, 1), eval_metric="logloss", tree_method="hist",
                         n_jobs=2, random_state=seed, verbosity=0)
def rforest(y, seed):
    return RandomForestClassifier(n_estimators=300, max_depth=5, min_samples_leaf=2, class_weight="balanced_subsample",
                                  n_jobs=2, random_state=seed)

def avg_prob(builder, tr, te, cols, y_tr, add_m0=False):
    Xtr, Xte = prep(tr, cols), prep(te, cols)
    if add_m0:
        Xtr["wu_flag"] = tr["m0_prediction"].astype(int).to_numpy(); Xte["wu_flag"] = te["m0_prediction"].astype(int).to_numpy()
    out = np.zeros(len(te))
    for s in SEEDS:
        m = builder(y_tr, s); m.fit(Xtr, y_tr); out += m.predict_proba(Xte)[:, 1]
    return out / len(SEEDS)

def rank01(p):
    return (rankdata(p) - 1) / max(len(p) - 1, 1)

def f1_fast(y, p):
    tp = int(((y == 1) & (p == 1)).sum()); fp = int(((y == 0) & (p == 1)).sum()); fn = int(((y == 1) & (p == 0)).sum())
    return 2 * tp / (2 * tp + fp + fn) if (2 * tp + fp + fn) else 0.0
def topk(prob, k):
    p = np.zeros(len(prob), dtype=int); p[np.argsort(-prob, kind="stable")[:k]] = 1; return p

NAMES = ["Detektor Pola Wu",
         "XGBoost Struktur Plan",
         "XGBoost Kardinalitas Lokal (lengkap)",
         "Random forest",
         "Gabungan peringkat (KANDIDAT UTAMA)",
         "Hibrida: XGBoost Struktur Plan + sinyal Wu",
         "Hibrida: XGBoost lengkap + sinyal Wu"]

def one_direction(tr, te, lab, mult=1.0):
    y_tr = tr[lab].astype(int).to_numpy()
    y = te[lab].astype(int).to_numpy(); g = te["template_id"].astype(str).to_numpy()
    p0 = te["m0_prediction"].astype(int).to_numpy(); k0 = int(p0.sum())
    pr = {}
    pr["XGBoost Struktur Plan"] = avg_prob(xgb, tr, te, M1_COLS, y_tr)
    pr["XGBoost Kardinalitas Lokal (lengkap)"] = avg_prob(xgb, tr, te, ALL_COLS, y_tr)
    pr["Random forest"] = avg_prob(rforest, tr, te, ALL_COLS, y_tr)
    pr["Gabungan peringkat (KANDIDAT UTAMA)"] = (rank01(pr["XGBoost Struktur Plan"]) +
        rank01(pr["XGBoost Kardinalitas Lokal (lengkap)"]) + rank01(pr["Random forest"])) / 3.0
    pr["Hibrida: XGBoost Struktur Plan + sinyal Wu"] = avg_prob(xgb, tr, te, M1_COLS, y_tr, add_m0=True)
    pr["Hibrida: XGBoost lengkap + sinyal Wu"] = avg_prob(xgb, tr, te, ALL_COLS, y_tr, add_m0=True)
    return y, g, p0, k0, pr

def boot(y, g, preds):
    rng = np.random.default_rng(BOOT_SEED)
    ug = np.unique(g); idx = {t: np.where(g == t)[0] for t in ug}
    out = {k: np.empty(N_BOOT) for k in preds}
    for b in range(N_BOOT):
        ii = np.concatenate([idx[t] for t in rng.choice(ug, len(ug), replace=True)])
        for k, p in preds.items(): out[k][b] = f1_fast(y[ii], p[ii])
    return out
def ci(b, a, c):
    d = b[a] - b[c]; return float(np.percentile(d, 2.5)), float(np.percentile(d, 97.5))

rows = []
for lab in ["label_v2", "label_v1"]:
    o = old[old[lab].notna()].reset_index(drop=True)
    n_ = new[new[lab].notna()].reset_index(drop=True)
    print("\n" + "=" * 86)
    print(f"{lab.upper()}  |  data lama n={len(o)} (Regression {int(o[lab].sum())})  |  data baru n={len(n_)} (Regression {int(n_[lab].sum())})")
    print("=" * 86)
    d1 = one_direction(o, n_, lab)   # lama -> baru
    d2 = one_direction(n_, o, lab)   # baru -> lama
    for nm, d in [("Arah 1 (latih LAMA, uji BARU)", d1), ("Arah 2 (latih BARU, uji LAMA)", d2)]:
        y, g, p0, k0, pr = d
        print(f"\n{nm}: n={len(y)}, Regression={int(y.sum())}, Wu menandai k={k0}")
        print(f"  {'Model':46s} {'TP':>3s} {'FP':>4s} {'F1':>6s}")
        print(f"  {'Detektor Pola Wu':46s} {int(((y==1)&(p0==1)).sum()):3d} {int(((y==0)&(p0==1)).sum()):4d} {f1_fast(y, p0):6.3f}")
        for k_, v in pr.items():
            p = topk(v, k0); print(f"  {k_:46s} {int(((y==1)&(p==1)).sum()):3d} {int(((y==0)&(p==1)).sum()):4d} {f1_fast(y, p):6.3f}")
    # gabungan dua arah
    y = np.concatenate([d1[0], d2[0]]); g = np.concatenate([d1[1], d2[1]])
    preds = {"Detektor Pola Wu": np.concatenate([d1[2], d2[2]])}
    for k_ in NAMES[1:]:
        preds[k_] = np.concatenate([topk(d1[4][k_], d1[3]), topk(d2[4][k_], d2[3])])
    b = boot(y, g, preds)
    f0 = f1_fast(y, preds["Detektor Pola Wu"])
    print(f"\nGABUNGAN DUA ARAH (anggaran sama per arah): n={len(y)}, Regression={int(y.sum())}, ditandai Wu={int(preds['Detektor Pola Wu'].sum())}")
    print(f"  {'Model':46s} {'TP':>3s} {'FP':>4s} {'Prec':>6s} {'Rec':>6s} {'F1':>6s}   selisih F1 vs Wu [CI 95%]")
    for k_, p in preds.items():
        tp = int(((y == 1) & (p == 1)).sum()); fp = int(((y == 0) & (p == 1)).sum()); f = f1_fast(y, p)
        if k_ == "Detektor Pola Wu":
            print(f"  {k_:46s} {tp:3d} {fp:4d} {tp/max(tp+fp,1):6.3f} {tp/max(int(y.sum()),1):6.3f} {f:6.3f}   (pembanding)"); continue
        lo, hi = ci(b, k_, "Detektor Pola Wu")
        flag = "   <- CI tidak memuat 0" if lo > 0 else ""
        print(f"  {k_:46s} {tp:3d} {fp:4d} {tp/max(tp+fp,1):6.3f} {tp/max(int(y.sum()),1):6.3f} {f:6.3f}   {f-f0:+.3f} [{lo:+.3f},{hi:+.3f}]{flag}")
        rows.append({"label": lab, "model": k_, "TP": tp, "FP": fp, "F1": f, "dF1_vs_Wu": f - f0, "CI_low": lo, "CI_high": hi,
                     "n": len(y), "Regression": int(y.sum())})
    print("\n  Kontras terhadap XGBoost Kardinalitas Lokal (lengkap), model yang diusulkan semula:")
    base = "XGBoost Kardinalitas Lokal (lengkap)"
    for k_ in NAMES[1:]:
        if k_ == base: continue
        lo, hi = ci(b, k_, base)
        print(f"    {k_:46s} = {f1_fast(y, preds[k_]) - f1_fast(y, preds[base]):+.3f} [{lo:+.3f},{hi:+.3f}]"
              f"{'   <- CI tidak memuat 0' if lo > 0 or hi < 0 else ''}")
    # sapuan anggaran (deskriptif): F1 jika anggaran dikali 0,5 / 1 / 1,5 / 2 dari jumlah tanda Wu
    print("\n  Sapuan anggaran (deskriptif): F1 gabungan dua arah bila jumlah tanda = kelipatan dari jumlah tanda Wu")
    print(f"  {'Model':46s} " + " ".join(f"{m:>6.1f}x" for m in [0.5, 1.0, 1.5, 2.0]))
    for k_ in NAMES[1:]:
        vals = []
        for m in [0.5, 1.0, 1.5, 2.0]:
            pp = np.concatenate([topk(d1[4][k_], int(round(m * d1[3]))), topk(d2[4][k_], int(round(m * d2[3])))])
            vals.append(f1_fast(y, pp))
        print(f"  {k_:46s} " + " ".join(f"{v:7.3f}" for v in vals))

OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
pd.DataFrame(rows).to_csv(OUT_CSV, index=False)
print("\nTersimpan:", OUT_CSV)
print("\nCARA BACA:")
print("  - Bagian GABUNGAN DUA ARAH adalah angka utama. Lihat baris 'Gabungan peringkat' (kandidat utama).")
print("  - Kalau CI selisih F1 terhadap Wu tidak memuat 0, itu penguatan bukti. Kalau masih memuat 0, dilaporkan: belum terbukti.")
print("  - Sapuan anggaran hanya deskriptif (menunjukkan model mana yang lebih baik di berbagai jumlah tanda).")
