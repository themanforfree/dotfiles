function assert_installed() {
    if command -v "${1:-}" &> /dev/null; then
        info "${1:-} is already installed"
        exit 0
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