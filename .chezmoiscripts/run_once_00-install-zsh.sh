#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

set -Eeuo pipefail

if [ "${DOTFILES_DEBUG:-}" ]; then
    set -x
fi

function install_zsh() {
    assert_installed "zsh"
    # Install zsh using homebrew
    package_install "zsh"
}

function uninstall_zsh() {  
    package_remove "zsh"
}

function main() {
    install_zsh
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi
