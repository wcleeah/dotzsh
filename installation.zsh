# installation script
touch exports.zsh
if [ ! -f ~/.zshrc ]; then
	touch ~/.zshrc
fi
echo "source ~/.zsh/.zshrc" >> ~/.zshrc

# Prompt
git submodule update --init

# Source all the alias and exports
source ~/.zshrc

# Sync  plugins
# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
# eza
sudo apt update
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Opencode
curl -fsSL https://opencode.ai/install | bash

# FNM
curl -fsSL https://fnm.vercel.app/install | bash

# By apt
sudo apt update
sudo apt -y install bat fzf jq ripgrep tmux gh

# snap
sudo snap install yq

source ~/.zshrc

# Custom config
## diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RF"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

## rerere for better rebase
git config --global rerere.enabled true

echo "All the auto configurable stuffs is installed, please config yourself for the following manual configuration"
