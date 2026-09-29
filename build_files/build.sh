#!/bin/bash
# Orchestrator: copies system_files, then runs every module in build_files/modules/ in order.

set -ouex pipefail

BUILD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=lib.sh
source "$BUILD_DIR/lib.sh"

log "Copying system_files/ to /"
cp -avf "/ctx/system_files"/. /

# Run modules in filename order. Rename a module to *.sh.disabled to skip it.
shopt -s nullglob
for module in "$BUILD_DIR"/modules/*.sh; do
    log "Module: $(basename "$module")"
    # shellcheck source=/dev/null
    source "$module"
done

log "Build complete"
