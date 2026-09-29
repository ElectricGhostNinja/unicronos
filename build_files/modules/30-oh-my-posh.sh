#!/bin/bash
# oh-my-posh prompt (prebuilt binary). Config lives in system_files/.

case "$(uname -m)" in
    x86_64) arch=amd64 ;;
    aarch64) arch=arm64 ;;
    *)
        echo "Unsupported arch for oh-my-posh: $(uname -m)" >&2
        exit 1
        ;;
esac

# Pin a version by replacing "latest/download" with "download/v<version>".
install_binary \
    "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-${arch}" \
    /usr/bin/oh-my-posh
