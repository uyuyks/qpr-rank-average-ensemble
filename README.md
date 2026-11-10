# Detecting Query Performance Regression in SQL Server Index Tuning with a Rank-Average Ensemble of Cost-Sensitive Models

Repositori ini berisi kode, data, dan hasil yang mendukung makalah di atas.

Penelitian ini membahas query yang justru menjadi lebih lambat setelah sebuah indeks ditambahkan, yang disebut *Query Performance Regression* (QPR). Pertanyaannya: apakah model machine learning bisa mengenali QPR lebih baik daripada detektor berbasis pola dari Wu et al.? Percobaan memakai benchmark DSB skala 10 di Microsoft SQL Server 2022. Metode yang diusulkan, Rank-Average Ensemble, dibandingkan dengan detektor Wu pada jumlah transisi yang ditandai (flag) yang sama, supaya perbandingannya adil.

## Isi repositori

| Lokasi | Isi |
|---|---|
| `qpr_rank_average_ensemble.ipynb` | Notebook utama: pengukuran label, evaluasi, ablasi, SHAP, dan analisis galat |
| `scripts/` | Skrip untuk setiap analisis di makalah, diberi nomor sesuai urutan menjalankan |
| `results/` | Hasil penting: gambar SHAP, riwayat Optuna, dan analisis galat |
| `data/` | Fitur, label, dan rekomendasi indeks dari kedua batch data |
| `requirements.txt` | Daftar pustaka Python |

## Gambaran singkat percobaan

Satu *transisi* berarti satu langkah penambahan indeks pada satu query.

1. Workload DSB skala 10 berisi 74 query (37 template, masing-masing dua instance). Indeks ditambahkan satu per satu oleh Database Engine Tuning Advisor (DTA).
2. Pada setiap langkah, execution plan sebelum dan sesudah indeks dicatat, lalu diambil 117 fitur darinya.
3. Waktu jalan query diukur beberapa kali dan diambil mediannya. Sebuah transisi dihitung sebagai QPR jika waktu jalan sesudah indeks minimal 1,5 kali waktu sebelumnya.
4. Ada dua batch data: batch lama (seed 997, 322 transisi) dan batch baru (seed 2026, 328 transisi). Model dilatih di satu batch dan diuji di batch yang lain, lalu arahnya dibalik. Pada setiap pengujian, jumlah transisi yang ditandai disamakan dengan detektor Wu.
5. Rank-Average Ensemble merata-ratakan peringkat skor dari tiga model: XGBoost berbasis struktur plan, XGBoost berbasis kardinalitas lokal, dan random forest.

## Cara mengulang percobaan

Evaluasi model bisa diulang di Google Colab (CPU) hanya dari berkas di `data/`. Mengukur ulang waktu jalan query memerlukan SQL Server sendiri.

1. Buka Colab, lalu sambungkan Google Drive.
2. Salin berkas dari `data/` ke `MyDrive/QPR_SF10_Research/` dengan susunan berikut:

   | Berkas di repositori | Letak di Drive |
   |---|---|
   | `data/batch_lama/incremental_m0_m2b_features.csv` | `incremental/incremental_m0_m2b_features.csv` |
   | `data/batch_lama/remeasure_labels_v2.csv` | `incremental/remeasure/remeasure_labels_v2.csv` |
   | `data/batch_baru/incremental_m0_m2b_features.csv` | `fresh/incremental_fresh/incremental_m0_m2b_features.csv` |
   | `data/batch_baru/remeasure_labels_v2.csv` | `fresh/incremental_fresh/remeasure/remeasure_labels_v2.csv` |

3. Pasang pustaka dengan `pip install -r requirements.txt`.
4. Jalankan skrip di `scripts/` sesuai nomornya:
   - `01_ablasi_baseline.py`: ablasi dan baseline tambahan (boleh dilewati)
   - `02_uji_dua_arah_gabungan.py`: uji dua arah dan gabungan peringkat
   - `03_figur_metrik.py`: tabel metrik dan gambar dasar
   - `04_shap_galat_optuna.py`: SHAP, analisis galat, dan Optuna
   - `05_analisis_rasio_waktu.py`: analisis galat menurut rasio waktu

   Seluruh alur, termasuk pengukuran label dan evaluasi utama, ada di `qpr_rank_average_ensemble.ipynb`.
5. Semua seed ditetapkan: 42 sampai 46 untuk model, 42 untuk Optuna, dan 2026 untuk bootstrap.

Hasil skrip 04 dan 05 tersimpan di `MyDrive/QPR_SF10_Research/artikel_gambar/analisis_lanjutan/`. Untuk analisis menurut rasio waktu, pakai berkas `*_rasio_waktu.csv` dari skrip 05.

## Data

Setiap batch punya folder sendiri di `data/`: `batch_lama/` (seed 997, 322 transisi valid) dan `batch_baru/` (seed 2026, 328 transisi).

| Berkas | Isi |
|---|---|
| `incremental_m0_m2b_features.csv` | Fitur dan label dari satu kali pengukuran, satu baris per transisi (143 kolom) |
| `remeasure_labels_v2.csv` | Label v2 dari pengukuran berulang (median) |
| `dta_bertahap_rekomendasi.sql` | Rekomendasi indeks DTA per query dan per iterasi, saat indeks ditambahkan satu per satu (batch lama 325, batch baru 328) |
| `dta_bertahap_objek_dibuat.csv` | Indeks dan statistik yang dibuat pada tiap iterasi |
| `dta_bertahap_ringkasan.csv`, `dta_bertahap_status.csv` | Ringkasan urutan iterasi dan status tiap query |
| `dta_sekali_jalan_rekomendasi.sql`, `dta_sekali_jalan_status.csv` | Rekomendasi DTA satu kali jalan untuk 74 query, 72 di antaranya menghasilkan rekomendasi (hanya batch lama) |

Berkas fitur dan label hanya berisi identitas transisi, angka fitur, dan label.

### Sumber data DSB

Datanya berasal dari benchmark publik DSB yang dibangkitkan sendiri, tanpa data perusahaan. Workload dibangkitkan dengan `dsqgen` dan `distcomp` dari [repositori DSB resmi](https://github.com/microsoft/dsb) (lisensi MIT) dengan pengaturan berikut:

- 37 template, dua instance per template
- parameter berdistribusi normal (sigma 2, pusat 0)
- seed 997 untuk batch lama

Teks query hasil bangkitan tidak disertakan di sini. Untuk mendapatkannya, bangkitkan ulang dengan pengaturan tersebut.

**Catatan tentang TPC-DS.** DSB diturunkan dari TPC-DS tetapi tidak memenuhi spesifikasi TPC-DS, jadi hasil di repositori ini tidak bisa dibandingkan dengan hasil TPC-DS yang dipublikasikan secara resmi (sesuai `NOTICE.md` di repositori DSB). Penelitian ini bersifat akademik dan tidak membuat klaim pemasaran.

## Spesifikasi komputasi

| Kebutuhan | Spesifikasi |
|---|---|
| Pengukuran waktu jalan | Laptop Windows 10 Enterprise, Intel Core i7-8550U, RAM 32 GB, Microsoft SQL Server 2022 |
| Pemodelan dan analisis | Google Colab, CPU saja |
| Pustaka Python | Lihat `requirements.txt`. Versi pustaka belum dikunci; gunakan versi bawaan Google Colab pada November 2026 |
