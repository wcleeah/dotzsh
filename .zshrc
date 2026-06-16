# Prompt
setopt nopromptbang prompt{cr,percent,sp,subst}
source ~/.zsh/prompt/git-prompt/git-prompt.zsh
source ~/.zsh/hooks/hooks.zsh
## pwd
PROMPT="%F{magenta}%~ "

## git
ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{white}]"
PROMPT=$PROMPT'%F{010}git:$(gitprompt) '

NEWLINE=$' - vps \n'
PROMPT=$PROMPT"${NEWLINE}"

# Paths
export FPATH="~/.zsh/prompt/eza/completions/zsh:$FPATH"
export PATH=$HOME/.zsh/scripts:$PATH
export PATH=$PATH:"~/.local/bin"
export PATH=$PATH:"~/.atuin/bin"

# Sources
setopt EXTENDED_GLOB
for file in ~/.zsh/alias/**/*.zsh(.N); do
  source "$file"
done
source ~/.zsh/exports.zsh
source ~/.zsh/keymap.zsh
source ~/.zsh/prompt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # has to be init at last
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Init
eval "$(zoxide init zsh)"

# opencode
export PATH=/home/mac/.opencode/bin:$PATH
