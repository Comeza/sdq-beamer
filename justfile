DATA-DIR := env_var_or_default("XDG_DATA_HOME", "~/.local/share")
PATH     := DATA-DIR + "/typst/packages/local/sdq-bamer"
VERSION  := `cat typst.toml | rg -o 'version = "(.*)"' -r '$1'`

alias i  := install
alias u  := uninstall
alias ua := uninstall-all

[doc("(Re-)Installs the sdq-beamer package for the user.")]
default: uninstall && install

[doc("Get the version to build")]
@get-version:
    echo {{VERSION}}

[doc("Installs the sdq-beamer package for the user.")]
install:
    @echo "Installing sdq-beamer:{{VERSION}}"
    mkdir -p {{PATH}}/{{VERSION}}
    cp -r . {{PATH}}/{{VERSION}}
    @echo "Done"

[doc("Uninstalls the sdq-beamer package for the user.")]
uninstall:
    @echo "Uninstalling sdq-beamer"
    rm -rf {{PATH}}/{{VERSION}}
    @echo "Done"

[doc("Uninstalls every version of the sdq-beamer package")]
[confirm("Do you want to uninstall every version of the sdq-beamer package? [y/N]")]
uninstall-all:
    @echo "Uninstalling every sdq-beamer package"
    rm -rf {{PATH}}
    @echo "Done"

