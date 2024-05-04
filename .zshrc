# Prompt
source ~/.zsh/prompt/git-prompt/git-prompt.zsh
## pwd
PROMPT="%F{magenta}%~"

## kube-ps1
source ~/.zsh/prompt/kube-ps1/kube-ps1.sh 
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_PREFIX_COLOR=white
KUBE_PS1_SUFFIX_COLOR=white
PROMPT=$PROMPT' $(kube_ps1) '

## git
ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{white}]"
PROMPT=$PROMPT'$(gitprompt) '

## time
PROMPT=$PROMPT'%F{white}%D{%F %H:%M:%S} '

# Sources
source ~/.zsh/alias/k8s.zsh

# Exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Paths
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH=$PATH:$HOME/.dotbare

