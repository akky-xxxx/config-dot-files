# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shogo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shogo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shogo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shogo/google-cloud-sdk/completion.zsh.inc'; fi

setopt hist_ignore_dups
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
