#!/bin/bash
# Packages from the Fedora / RPM Fusion repos.

packages=(
    # shell + CLI tools
    fzf fd jq ripgrep eza bat fish zsh fastfetch
    # apps
    qbittorrent foot
    # editors
    emacs neovim helix
    # build tools
    make ninja meson clang
)

fedora_install "${packages[@]}"
