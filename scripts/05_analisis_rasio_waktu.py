# ============================================================
# ANALISIS KESALAHAN BERDASARKAN RASIO WAKTU (ratio_v2)
# Rasio waktu diambil dari kolom "ratio_v2" (median jalan berulang), bukan dari kolom "iteration".
# Membaca hasil analisis kesalahan sebelumnya + file label v2 dari Drive, lalu menghitung ulang tabel pita rasio dan satu gambar.
# ============================================================
import numpy as np, pandas as pd, matplotlib.pyplot as plt
from pathlib import Path
ROOT = Path("/content/drive/MyDrive/QPR_SF10_Research"); OUT = ROOT / "artikel_gambar" / "analisis_lanjutan"
E = pd.read_csv(OUT / "analisis_kesalahan_per_transisi.csv")
lab_old = pd.read_csv(ROOT / "incremental" / "remeasure" / "remeasure_labels_v2.csv")
lab_new = pd.read_csv(ROOT / "fresh" / "incremental_fresh" / "remeasure" / "remeasure_labels_v2.csv")
print("kolom file label:", list(lab_old.columns))
assert "ratio_v2" in lab_old.columns and "ratio_v2" in lab_new.columns, "kolom ratio_v2 tidak ada; periksa daftar kolom di atas"
parts = []
for arah, lab in [("lama->baru", lab_new), ("baru->lama", lab_old)]:      # batch uji tiap arah
    e = E[E["arah"] == arah].drop(columns=["rasio_waktu"], errors="ignore")
    parts.append(e.merge(lab[["sample_id", "ratio_v2"]], on="sample_id", how="left"))
E = pd.concat(parts, ignore_index=True).rename(columns={"ratio_v2": "rasio_v2"})
print("baris:", len(E), "| rasio kosong:", int(E.rasio_v2.isna().sum()))
chk = E[E.label == 1].rasio_v2.min(), E[E.label == 0].rasio_v2.max()
print(f"cek label: rasio terkecil di kelas Regression = {chk[0]:.2f} (harus >= 1,5); rasio terbesar di kelas Normal = {chk[1]:.2f} (harus < 1,5)")
bins = [0, 0.8, 1.0, 1.2, 1.5, 2, 3, 5, np.inf]; names = ["<0,8", "0,8-1,0", "1,0-1,2", "1,2-1,5", "1,5-2", "2-3", "3-5", ">=5"]
E["pita"] = pd.cut(E.rasio_v2, bins=bins, labels=names, right=False)
g = E.groupby("pita", observed=False).agg(n=("label", "size"), regression=("label", "sum"), wu_tandai=("wu_tandai", "sum"),
                                          gabungan_tandai=("ens_tandai", "sum"))
print("\nPer pita rasio waktu sebenarnya (sesudah/sebelum, median berulang):"); print(g.to_string())
r = E[E.label == 1]; n_ = E[E.label == 0]
tab = []
for nm, lo, hi in [("1,5-2", 1.5, 2), ("2-3", 2, 3), ("3-5", 3, 5), (">=5", 5, np.inf)]:
    s = r[(r.rasio_v2 >= lo) & (r.rasio_v2 < hi)]
    tab.append({"pita": nm, "jumlah_regression": len(s), "tertangkap_wu": int(s.wu_tandai.sum()), "tertangkap_gabungan": int(s.ens_tandai.sum())})
tab = pd.DataFrame(tab); print("\nRecall menurut tingkat keparahan (hanya transisi Regression):"); print(tab.to_string(index=False))
fa = n_[n_.ens_tandai == 1]; fw = n_[n_.wu_tandai == 1]
def band(x):
    return pd.Series({"total": len(x), "<1,0": int((x.rasio_v2 < 1.0).sum()), "1,0-1,2": int(((x.rasio_v2 >= 1.0) & (x.rasio_v2 < 1.2)).sum()),
                      "1,2-1,5 (dekat ambang)": int(((x.rasio_v2 >= 1.2) & (x.rasio_v2 < 1.5)).sum())})
fp_tab = pd.DataFrame({"Detektor Pola Wu": band(fw), "Gabungan peringkat": band(fa)}).T
print("\nAlarm palsu menurut rasio waktu sebenarnya:"); print(fp_tab.to_string())
fn = r[r.ens_tandai == 0]
print(f"\nRegression yang lolos Gabungan: {len(fn)}; rasio 1,5-2 (dekat ambang) {int(((fn.rasio_v2>=1.5)&(fn.rasio_v2<2)).sum())}, "
      f"2-3 {int(((fn.rasio_v2>=2)&(fn.rasio_v2<3)).sum())}, >=3 {int((fn.rasio_v2>=3).sum())}; median rasio {fn.rasio_v2.median():.2f} "
      f"(Regression yang tertangkap Gabungan: {r[r.ens_tandai==1].rasio_v2.median():.2f}; yang tertangkap Wu: {r[r.wu_tandai==1].rasio_v2.median():.2f})")
print("Regression terparah yang lolos Gabungan (10 teratas):")
print(fn.sort_values("rasio_v2", ascending=False)[["template_id", "arah", "rasio_v2", "wu_tandai", "ens_peringkat", "rasio_biaya_perkiraan"]].head(10).round(2).to_string(index=False))
print("Alarm palsu Gabungan dengan rasio tertinggi (10 teratas):")
print(fa.sort_values("rasio_v2", ascending=False)[["template_id", "arah", "rasio_v2", "wu_tandai", "ens_peringkat", "rasio_biaya_perkiraan"]].head(10).round(2).to_string(index=False))
E.to_csv(OUT / "analisis_kesalahan_per_transisi_rasio_waktu.csv", index=False); g.to_csv(OUT / "analisis_kesalahan_pita_rasio_waktu.csv")
fig, ax = plt.subplots(1, 2, figsize=(9.6, 3.6))
x = np.arange(len(tab)); w = 0.38
ax[0].bar(x - w/2, tab.tertangkap_wu, w, color="#6b7280", label="Detektor Pola Wu"); ax[0].bar(x + w/2, tab.tertangkap_gabungan, w, color="#B07AA1", label="Gabungan peringkat")
for i, t in enumerate(tab.jumlah_regression): ax[0].text(i, max(tab.tertangkap_wu[i], tab.tertangkap_gabungan[i]) + 0.3, f"dari {t}", ha="center", fontsize=8)
ax[0].set_xticks(x); ax[0].set_xticklabels(tab.pita); ax[0].set_xlabel("Rasio waktu sebenarnya (sesudah/sebelum)"); ax[0].set_ylabel("Regression tertangkap")
ax[0].set_title("Regression tertangkap menurut keparahan", fontsize=10, loc="left"); ax[0].legend(fontsize=8); ax[0].grid(axis="y", color="#e5e7eb"); ax[0].set_axisbelow(True)
cols = ["<1,0", "1,0-1,2", "1,2-1,5 (dekat ambang)"]; x2 = np.arange(len(cols))
ax[1].bar(x2 - w/2, fp_tab.loc["Detektor Pola Wu", cols], w, color="#6b7280", label="Detektor Pola Wu"); ax[1].bar(x2 + w/2, fp_tab.loc["Gabungan peringkat", cols], w, color="#B07AA1", label="Gabungan peringkat")
ax[1].set_xticks(x2); ax[1].set_xticklabels(cols, fontsize=8); ax[1].set_xlabel("Rasio waktu sebenarnya"); ax[1].set_ylabel("Alarm palsu")
ax[1].set_title("Alarm palsu menurut rasio waktu sebenarnya", fontsize=10, loc="left"); ax[1].grid(axis="y", color="#e5e7eb"); ax[1].set_axisbelow(True)
fig.tight_layout(); fig.savefig(OUT / "gambar_galat_keparahan.png", dpi=220, facecolor="white"); plt.close(fig)
