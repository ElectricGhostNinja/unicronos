#!/bin/bash
# Helper functions shared by all modules.

log() {
    printf '\n==> %s\n' "$*"
}

# fedora_install pkg [pkg...]
# Install packages from the repos already enabled on the image.
fedora_install() {
    dnf5 install -y "$@"
}

# copr_install owner/project pkg [pkg...]
# Enable a COPR, install packages from it, then disable it again so it
# doesn't stay enabled on the final image.
copr_install() {
    local repo="$1"
    shift
    dnf5 -y copr enable "$repo"
    dnf5 -y install "$@"
    dnf5 -y copr disable "$repo"
}

# install_binary url /usr/bin/name
# Download a prebuilt binary and make it executable.
# Use /usr/bin, not /usr/local/bin (which lives in /var on bootc systems).
install_binary() {
    local url="$1" dest="$2"
    curl -fsSL -o "$dest" "$url"
    chmod 0755 "$dest"
}

# enable_service unit [unit...]
enable_service() {
    systemctl enable "$@"
}
