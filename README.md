# Cara Kompilasi Skripsi LaTeX

## Prasyarat
Pastikan sudah terinstall salah satu distribusi LaTeX:
- **macOS**: [MacTeX](https://www.tug.org/mactex/)
- **Windows**: [MiKTeX](https://miktex.org/) atau [TeX Live](https://www.tug.org/texlive/)
- **Linux**: `sudo apt install texlive-full`

## Kompilasi Manual (Terminal)

Jalankan urutan berikut dari folder `latex/`:

```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

> Harus dijalankan **4 kali** agar referensi, daftar isi, dan sitasi terbentuk dengan benar.

## Kompilasi Otomatis dengan `latexmk`

```bash
latexmk -pdf -interaction=nonstopmode main.tex
```

Untuk membersihkan file sementara:
```bash
latexmk -c
```

## Struktur Folder

```
latex/
├── main.tex                    ← Dokumen utama
├── chapters/
│   ├── cover.tex               ← Halaman judul
│   ├── lembar_pengesahan.tex
│   ├── pernyataan_keaslian.tex
│   ├── abstrak.tex
│   ├── abstract.tex
│   ├── kata_pengantar.tex
│   ├── bab1_pendahuluan.tex
│   ├── bab2_tinjauan_pustaka.tex
│   ├── bab3_metodologi.tex
│   ├── bab4_hasil_pembahasan.tex
│   ├── bab5_penutup.tex
│   └── lampiran.tex
├── references/
│   └── daftar_pustaka.bib      ← Referensi BibTeX
└── assets/
    └── logo_universitas.png    ← Taruh logo di sini
```

## Tips
- Hapus `\usepackage{lipsum}` dan semua `\lipsum[...]` setelah konten asli diisi.
- Ganti semua teks placeholder (`Nama Lengkap`, `NIM`, `Judul Skripsi`, dll.).
- Taruh gambar di folder `assets/` dan panggil dengan `\includegraphics`.
