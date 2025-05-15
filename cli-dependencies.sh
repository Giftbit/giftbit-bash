function install_dependency_macos() {
    if [[ "$(uname -s)" != "Darwin" ]]; then
        # assume on non-macOS that dependencies are already installed
        return
    fi
    if ! which $1 &> /dev/null; then
        echo "Installing $1..."
        if [[ "$1" == "brew" ]]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
            brew install $1
        fi
        exit_code=$?
        if [[ $exit_code -ne 0 ]]; then
            echo -e "${RED}❌ Error installing $1${NC}"
        else
            echo -e "${GREEN}🟢 $1 installed${NC}" && echo ""
        fi
        return $exit_code
    fi
}
export -f install_dependency_macos
