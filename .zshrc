# Prompt
source ~/.zsh/prompt/git-prompt/git-prompt.zsh
## pwd
PROMPT="%F{magenta}%~"

## kube-ps1
source ~/.zsh/prompt/kube-ps1/kube-ps1.sh 
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_PREFIX_COLOR=white
KUBE_PS1_SUFFIX_COLOR=white
PROMPT=$PROMPT' %F{blue}k8s:$(kube_ps1) '

## git
ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{white}]"
PROMPT=$PROMPT'%F{010}git:$(gitprompt) '

## time
PROMPT=$PROMPT'%F{white}%D{%F %H:%M:%S} %{$reset_color%}'

NEWLINE=$'\n'
PROMPT=$PROMPT"${NEWLINE}"

# Paths
export PATH=/opt/homebrew/bin:$PATH
export FPATH="~/.zsh/prompt/eza/completions/zsh:$FPATH"
export PATH=$HOME/.zsh/scripts:$PATH

# Sources
setopt EXTENDED_GLOB
for file in ~/.zsh/alias/**/*.zsh(.N); do
  source "$file"
done
source ~/.zsh/exports.zsh
source ~/.config/op/plugins.sh # 1password
source ~/.zsh/prompt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # has to be init at last
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Init
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(direnv hook zsh)"
eval "$(atuin init zsh)"
bindkey jj vi-cmd-mode

