# 🍩 Donat Bu Diana - Sistem Informasi Manajemen Berbasis Komponen

Aplikasi web Sistem Informasi Manajemen (SIM) untuk UMKM **Donat Bu Diana** yang dibangun dengan arsitektur frontend modern berbasis komponen menggunakan **Vue.js v3 (`<script setup>`)**, **Pinia Store**, **Vue Router**, dan **Tailwind CSS**.

Proyek ini disusun untuk memenuhi seluruh kriteria dan indikator penilaian Tugas UTS dengan standar nilai **Sangat Baik (A)**.

---

## 🚀 Cara Menjalankan Proyek Secara Lokal

1. **Buka Terminal / PowerShell di folder ini:**
   ```bash
   cd "C:\Users\Bima Nugroho\.gemini\antigravity\scratch\donat-bu-diana"
   ```

2. **Jalankan Development Server:**
   ```bash
   npm run dev
   ```

3. **Buka di Browser:**
   Akses tautan lokal yang muncul di terminal (biasanya `http://localhost:5173`).

---

## 👥 3 Role Pengguna & Fitur Utama

Sistem telah dilengkapi dengan fitur **Quick Role Switcher** di bilah navigasi atas (*top bar*) sehingga dosen / penguji dapat berpindah role secara instan dalam 1 klik:

### 1. 👑 Pemilik Usaha (Owner)
- **Ringkasan Pendapatan & Omzet**: Dashboard statistik omzet kotor, estimasi laba bersih (omzet - HPP modal), total pesanan, dan menu aktif.
- **Analisis Kategori & Best Sellers**: Grafik kontribusi penjualan per kategori dan daftar donat paling laris.
- **Kelola Master Data Produk (CRUD)**: Tambah donat baru, ubah harga jual, ubah modal (HPP), update stok, sembunyikan dari katalog, dan hapus menu.
- **Laporan Penjualan**: Rekapitulasi transaksi lengkap dengan tombol **Unduh CSV (Excel)**, **Unduh JSON**, dan **Cetak Laporan**.

### 2. 🧑‍💼 Petugas Kasir (Cashier / POS)
- **Point of Sale (POS) Kasir**: Antarmuka 2 kolom modern untuk memilih varian donat, mengatur jumlah pesanan, dan menghitung otomatis subtotal.
- **Kalkulator Pembayaran & Kembalian**: Pilihan metode bayar (Tunai, QRIS, Transfer BCA) dengan perhitungan kembalian otomatis dan tombol nominal cepat.
- **Cetak Nota Transaksi**: Pop-up struk pembayaran resmi dengan format cetak termal 80mm standar kasir.
- **Kelola Status Pesanan**: Pembaruan status pesanan (*Sedang Dibuat*, *Siap Diambil*, *Selesai*) dan status pembayaran (*Lunas* / *Belum Bayar*).

### 3. 🛍️ Pelanggan (Customer)
- **Katalog Donat Interaktif**: Menampilkan varian donat kentang, filter berdasarkan kategori (Klasik, Glaze, Bomboloni, Minuman), dan pencarian kata kunci.
- **Lacak Pesanan Mandiri**: Masukkan Nomor Nota Transaksi (contoh: `ORD-20261109-001`) untuk memantau progres pembuatan donat dengan indikator *stepper progress*.

---

## 💾 Arsitektur Data Seed & LocalStorage
- **Folder Seed Khusus**: Tersedia di `src/data/seed/` (`products.json`, `categories.json`, `orders.json`, `users.json`).
- **Persistensi Penuh**: Seluruh aksi penambahan donat, transaksi kasir, dan perubahan status otomatis tersimpan ke `localStorage` dan bertahan secara permanen meskipun halaman di-refresh.
- **Tombol Reset Default**: Terdapat tombol *"Reset Data Default"* di navigasi atas jika ingin mengembalikan data ke kondisi semula saat demonstrasi.

---

## 📄 Dokumen Laporan UTS
Dokumen laporan UTS lengkap sesuai template soal telah dibuat di:
👉 **`LAPORAN_UTS_DONAT_BU_DIANA.md`**
Mencakup Halaman Sampul, Bab 1 (Analisis Bisnis & Role), Bab 2 (Component Tree, Spesifikasi Endpoint API, ERD, Style Guide), Bab 3 (Implementasi Frontend & Seed), dan Bab 4 (Dokumentasi Prompt AI & Matriks 13 Skenario Pengujian).
