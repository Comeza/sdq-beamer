VERSION   := `cat typst.toml | rg -o 'version = "(.*)"' -r '$1'`

DATA-DIR  := data_directory() + "/"
BASE-PATH := DATA-DIR + "typst/packages/"
NAMESPACE := "local"
NAME      := "sdq-beamer"
SUBPATH   := BASE-PATH + NAMESPACE + "/" + NAME
PATH      := SUBPATH + "/" + VERSION

alias i   := install
alias u   := uninstall
alias ua  := uninstall-all

[doc("(Re-)Installs the sdq-beamer package for the user.")]
default: uninstall && install

@info:
    echo "DEPENDENCIES"
    echo "   typst:      `command -v typst || echo 'NOT FOUND'`"
    echo "   ripgrep:    `command -v rg || echo 'NOT FOUND'`"
    echo ""
    echo "PATHS"
    echo "   base-path: {{BASE-PATH}}"
    echo "   namespace: {{NAMESPACE}}"
    echo "   name:      {{NAME}}"
    echo "   version:   {{VERSION}}"
    echo "   path:      {{PATH}}"

[doc("Installs the sdq-beamer package for the user.")]
install:
    @echo Installing sdq-beamer:{{VERSION}}
    mkdir -p {{PATH}}
    cp -r . {{PATH}}
    @echo "Done"

[doc("Uninstalls the sdq-beamer package for the user.")]
uninstall:
    @echo Uninstalling sdq-beamer:{{VERSION}}
    rm -rf {{PATH}}
    @echo "Done"

[doc("Uninstalls every version of the sdq-beamer package")]
[confirm("Do you want to uninstall every version of the sdq-beamer package? [y/N]")]
uninstall-all:
    @echo Uninstalling {{SUBPATH}}
    rm -rf {{SUBPATH}}
    @echo "Done"

[doc("Symlinks the current repo to the local install path for rapid development.")]
symlink:
    mkdir -p {{PATH}}
    rm -rf {{PATH}}
    ln -s {{justfile_directory()}} {{PATH}}
