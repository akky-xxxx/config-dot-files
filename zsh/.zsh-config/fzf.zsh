## Filter git branch names
function fzf-git-branches() {
    local res=$(git branch -a | sed 's/^\*/ /' | awk '{ print $1 }' | fzf | sed -E "s/^remotes\/origin\///")
    git checkout $res
}
alias cb="fzf-git-branches"
# zle -N fzf-git-branches
# bindkey '^xb' fzf-git-branches

# 一度でも cd したことのあるディレクトリに効率よく cd する設定
# cd 履歴を記録
typeset -U chpwd_functions
CD_HISTORY_FILE=${HOME}/.cd_history_file # cd 履歴の記録先ファイル
function chpwd_record_history() {
    echo $PWD >> ${CD_HISTORY_FILE}
}
chpwd_functions=($chpwd_functions chpwd_record_history)

# fzf を使って cd 履歴の中からディレクトリを選択
# 過去の訪問回数が多いほど選択候補の上に来る
function fzf_get_destination_from_history() {
    sort ${CD_HISTORY_FILE} | uniq -c | sort -r | \
        sed -e 's/^[ ]*[0-9]*[ ]*//' | \
        sed -e s"/^${HOME//\//\\/}/~/" | \
        fzf | xargs echo
}

# fzf を使って cd 履歴の中からディレクトリを選択し cd するウィジェット
function fzf_cd_history() {
    local destination=$(fzf_get_destination_from_history)
    [ -n $destination ] && cd ${destination/#\~/${HOME}}
    zle reset-prompt
}
zle -N fzf_cd_history
bindkey '^H' fzf_cd_history

# fzf を使って cd 履歴の中からディレクトリを選択し，現在のカーソル位置に挿入するウィジェット
function fzf_insert_history() {
    local destination=$(fzf_get_destination_from_history)
    if [ $? -eq 0 ]; then
        local new_left="${LBUFFER} ${destination} "
        BUFFER=${new_left}${RBUFFER}
        CURSOR=${#new_left}
    fi
    zle reset-prompt
}
zle -N fzf_insert_history
# }}}

function fzf-history-selection() {
    BUFFER=`history 1 | sort -r | sed 's/^[ ]*[0-9]*//g' | fzf`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N fzf-history-selection
bindkey '^R' fzf-history-selection

# C-x ; でディレクトリに cd
# C-x i でディレクトリを挿入
# bindkey '^x;' fzf_cd_history
# bindkey '^xi' fzf_insert_history

# auto-fu.zsh を使っているのなら以下も
# bindkey -M afu '^x;' fzf_cd_history
# bindkey -M afu '^xi' fzf_insert_history
