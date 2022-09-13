source ~/.zplug/init.zsh

zplug "b4b4r07/enhancd", use:"init.sh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
 
if ! zplug check --verbose; then
    printf "インストールしますか？[y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load