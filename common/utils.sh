function assert_installed() {
    if command -v "${1:-}" &> /dev/null; then
        info "${1:-} is already installed"
        exit 0
    fi
}

function package_install() {
    package_name="${1:-}"
    info "Installing ${package_name}"
    if command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y ${package_name}
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm ${package_name}
    elif command -v brew >/dev/null 2>&1; then
        brew install ${package_name}
    else
        error "未找到支持的包管理器，请手动安装 ${package_name}"
        exit 1
    fi
}

function package_remove() {
    package_name="${1:-}"
    info "Removing ${package_name}"
    if command -v apt >/dev/null 2>&1; then
        sudo apt remove -y ${package_name}
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -R --noconfirm ${package_name}
    elif command -v brew >/dev/null 2>&1; then
        brew uninstall ${package_name}
    else
        error "未找到支持的包管理器，请手动卸载 ${package_name}"
        exit 1
    fi
}

function info() {
    # print in green color
    echo -e "\033[32m[INFO]\033[0m ${1:-}"
}

function warn() {
    # print in yellow color
    echo -e "\033[33m[WARN]\033[0m ${1:-}"
}

function error() {
    # print in red color
    echo -e "\033[31m[ERROR]\033[0m ${1:-}"
}