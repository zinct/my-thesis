# Dockerfile for LaTeX compilation with XeLaTeX
# Supports: fontspec, babel, TikZ, algorithms, bibliography, and more

FROM debian:bookworm-slim

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    perl \
    wget \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

# Install TeX Live full scheme (includes XeLaTeX and all packages)
# Using install-tl for a complete installation
RUN apt-get update && apt-get install -y \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Download and install TeX Live
RUN mkdir /tmp/install-tl && cd /tmp/install-tl \
    && wget -q https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar -xzf install-tl-unx.tar.gz --strip-components=1 \
    && echo "selected_scheme scheme-full" > texlive.profile \
    && echo "TEXDIR /usr/local/texlive" >> texlive.profile \
    && echo "TEXMFCONFIG ~/.texlive2025/texmf-config" >> texlive.profile \
    && echo "TEXMFHOME ~/texmf" >> texlive.profile \
    && echo "TEXMFLOCAL /usr/local/texlive/texmf-local" >> texlive.profile \
    && echo "TEXMFSYSCONFIG /usr/local/texlive/texmf-config" >> texlive.profile \
    && echo "TEXMFSYSVAR /usr/local/texlive/texmf-var" >> texlive.profile \
    && echo "TEXMFVAR ~/.texlive2025/texmf-var" >> texlive.profile \
    && echo "binary_x86_64-linux 1" >> texlive.profile \
    && echo "instopt_adjustpath 0" >> texlive.profile \
    && echo "instopt_adjustrepo 1" >> texlive.profile \
    && echo "instopt_letter 0" >> texlive.profile \
    && echo "instopt_portable 0" >> texlive.profile \
    && echo "instopt_write18_restricted 1" >> texlive.profile \
    && echo "tlpdbopt_autobackup 1" >> texlive.profile \
    && echo "tlpdbopt_backupdir tlpkg/backups" >> texlive.profile \
    && echo "tlpdbopt_create_formats 1" >> texlive.profile \
    && echo "tlpdbopt_desktop_integration 1" >> texlive.profile \
    && echo "tlpdbopt_file_assocs 1" >> texlive.profile \
    && echo "tlpdbopt_generate_updmap 0" >> texlive.profile \
    && echo "tlpdbopt_install_docfiles 1" >> texlive.profile \
    && echo "tlpdbopt_install_srcfiles 1" >> texlive.profile \
    && echo "tlpdbopt_post_code 1" >> texlive.profile \
    && echo "tlpdbopt_sys_bin /usr/local/bin" >> texlive.profile \
    && echo "tlpdbopt_sys_info /usr/local/share/info" >> texlive.profile \
    && echo "tlpdbopt_sys_man /usr/local/share/man" >> texlive.profile \
    && echo "tlpdbopt_w32_multi_user 1" >> texlive.profile \
    && ./install-tl --profile=texlive.profile \
    && rm -rf /tmp/install-tl

# Add TeX Live to PATH
ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"

# Update TeX Live package manager and install additional packages if needed
RUN tlmgr update --self --all || true

# Install Microsoft fonts (includes Aptos alternatives if available)
# Also install common fonts
RUN apt-get update && apt-get install -y \
    fonts-liberation \
    fonts-dejavu-core \
    fonts-freefont-ttf \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /workspace

# Default command
CMD ["xelatex", "--version"]
