<div align="center">

# LaTeX Thesis Template

### A modern, structured LaTeX template for
undergraduate thesis writing.

Build, compile, and format your thesis with ease using XeLaTeX and VS Code.

<br />

<!-- Tech badges -->
<a href="https://www.latex-project.org/">
  <img alt="LaTeX" src="https://img.shields.io/badge/LaTeX-008080?style=for-the-badge&logo=latex&logoColor=white" />
</a>
<a href="https://code.visualstudio.com/">
  <img alt="VS Code" src="https://img.shields.io/badge/VS%20Code-0078D4?style=for-the-badge&logo=visualstudiocode&logoColor=white" />
</a>
<a href="https://github.com/James-Yu/LaTeX-Workshop">
  <img alt="LaTeX Workshop" src="https://img.shields.io/badge/LaTeX%20Workshop-4B32C3?style=for-the-badge&logo=visualstudiocode&logoColor=white" />
</a>

<br /><br />

<p>
  <a href="#about">About</a> ·
  <a href="#features">Features</a> ·
  <a href="#requirements">Requirements</a> ·
  <a href="#quick-start">Quick Start</a> ·
  <a href="#architecture">Architecture</a>
</p>

</div>

---

## About

**LaTeX Thesis Template** is a structured, ready-to-use LaTeX repository designed specifically for undergraduate thesis writing. It provides a polished development environment configured for VS Code with the LaTeX Workshop extension. It uses the XeLaTeX engine to support modern fonts (like Aptos) and includes pre-configured formatting for covers, approval sheets, abstracts, chapters, and bibliographies.

---

## Features

- **VS Code Integration** — Pre-configured `.vscode/settings.json` for automatic build-on-save using LaTeX Workshop.
- **XeLaTeX Engine** — Full support for modern system fonts via `fontspec`.
- **Aptos Font** — Configured to use the modern Aptos font family.
- **Structured Chapters** — Modular design with separate files for each chapter, abstract, and appendix.
- **Automated Bibliography** — Integrated `natbib` with `unsrtnat` style for seamless citation management.
- **Custom Formatting** — Pre-configured double spacing, custom margins, disabled hyphenation, and specific chapter title formats.
- **Table & Figure Support** — Pre-loaded packages for complex tables (`colortbl`, `multirow`, `array`) and floating figures.

---

## Requirements

- **LaTeX Distribution**:
  - **macOS**: [MacTeX](https://www.tug.org/mactex/) or TinyTeX
  - **Windows**: [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
  - **Linux**: `sudo apt install texlive-full`
- **Editor**: [Visual Studio Code](https://code.visualstudio.com/)
- **Extension**: [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- **Fonts**: Aptos font family installed on your system.

---

## Quick Start

### Using VS Code (Recommended)

1. Clone the repository and open it in VS Code.
2. Ensure the **LaTeX Workshop** extension is installed.
3. Open `main.tex` and save the file (`Cmd/Ctrl + S`).
4. The extension will automatically compile the document using the `xelatex × 2 + bibtex` recipe and output the PDF in the `build/` directory.

### Manual Compilation (Terminal)

Run the following sequence from the root directory to ensure references and citations are generated correctly:

```bash
xelatex -output-directory=build main.tex
bibtex build/main
xelatex -output-directory=build main.tex
xelatex -output-directory=build main.tex
```

---

## Architecture

```text
latex/
├── .vscode/
│   └── settings.json           # VS Code LaTeX Workshop config
├── build/                      # Compiled output directory
├── main.tex                    # Master document
├── main.bbl                    # Generated bibliography
├── README.md                   # This file
├── assets/                     # Images and figures
│   └── README.md
├── chapters/                   # Modular content files
│   ├── cover.tex               # Title page
│   ├── lembar_pengesahan.tex   # Approval sheet
│   ├── pernyataan_keaslian.tex # Originality statement
│   ├── abstrak.tex             # Indonesian abstract
│   ├── abstract.tex            # English abstract
│   ├── kata_pengantar.tex      # Foreword / Acknowledgements
│   ├── bab1_pendahuluan.tex    # Chapter 1
│   ├── bab2_tinjauan_pustaka.tex # Chapter 2
│   ├── bab3_metodologi.tex     # Chapter 3
│   ├── bab4_hasil_pembahasan.tex # Chapter 4
│   ├── bab5_penutup.tex        # Chapter 5
│   └── lampiran.tex            # Appendices
└── references/
    └── daftar_pustaka.bib      # Bibliography database
```
├── references/
│   └── daftar_pustaka.bib      ← Referensi BibTeX
└── assets/
    └── logo_universitas.png    ← Taruh logo di sini
```

## Tips
- Hapus `\usepackage{lipsum}` dan semua `\lipsum[...]` setelah konten asli diisi.
- Ganti semua teks placeholder (`Nama Lengkap`, `NIM`, `Judul Skripsi`, dll.).
- Taruh gambar di folder `assets/` dan panggil dengan `\includegraphics`.
