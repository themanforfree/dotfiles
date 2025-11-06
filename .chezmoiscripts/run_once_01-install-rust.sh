#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

set -Eeuo pipefail

if [ "${DOTFILES_DEBUG:-}" ]; then
    set -x
fi

function install_rust() {
    assert_installed "rustup"
    # Install rust using rustup
    # ref. https://www.rust-lang.org/tools/install
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
}

function uninstall_rust() {
    rustup self uninstall
}

function main() {
    install_rust
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
