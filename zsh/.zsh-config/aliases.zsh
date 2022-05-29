# common
alias mkdir='mkdir -p'
alias gb='cd ../ && cd -'
alias port='lsof -i -P | grep $@' # ポートのプロセスID取得
alias kp='kill -9 $@' # ポートキル
alias avni='npm i -g avn avn-nodebrew avn-n avn-nvm && avn setup'

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
alias gpo='git push -u origin $@'
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias -g R='`git branch -r | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

# node_modules を削除して npm install / yarn し直し
alias npmre='mv -f node_modules ~/.Trash/node_modules_`date "+%Y%m%d%H%M%S"` & npm i'
alias yarnre='mv -f node_modules ~/.Trash/node_modules_`date "+%Y%m%d%H%M%S"` & yarn'
