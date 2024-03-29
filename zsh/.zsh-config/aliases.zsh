# common
alias mkdir='mkdir -p'
alias gb='cd ../ && cd -'
alias kp='lsof -i -P | fzf | sed -e "s/^[^ ]*[ ]*\([0-9]*\).*/\1/" | xargs -n1 kill -9' # ポートキル

# yarn
alias ya='yarn add'
alias yad='yarn add -D'
alias yr='yarn remove'

# docker
alias d-c='docker-compose'
alias di='docker image'
alias dc='docker container'
alias dl='docker logs'
alias dp='docker ps'

# git commands
alias gd='git diff' # `git diff`の確認
alias gaa='git add .' # stage に全追加
alias gc='git commit' # commitする
alias gca='git commit --amend' #　前のコミットの編集
alias gcan='git commit --amend --no-edit' #
alias gr='git rebase -i $@' # 対話 rebase
alias grc='git rebase --continue' # rebase を続ける
alias gra='git rebase --abort' # rebase abort
alias glo='git log --oneline'
alias gs='git status'
alias gf='git fetch'
alias gcp='git cherry-pick $@'
alias grh='git reset --hard'
alias gp='git push'
alias gpo='git push -u origin B'
alias gco='git checkout B'
# branch list の表示、選択
alias -g B='`git branch | fzf | head -n 1 | sed -e "s/^\*\s*//g"`'
# log list の表示、ハッシュの選択
alias -g L='`git log --oneline | fzf | sed -e "s/\([a-z0-9]\{7\}\).*/\1/"`'

# node_modules を削除して npm install / yarn し直し
alias npmre='mv -f node_modules ~/.Trash/node_modules_`date "+%Y%m%d%H%M%S"` & npm i'
alias yarnre='mv -f node_modules ~/.Trash/node_modules_`date "+%Y%m%d%H%M%S"` & yarn'

# zsh config の更新
alias src='source ~/.zshrc'
