# installation script
# supposedly .zshrc is already in place
touch exports.zsh
if [ ! -f ~/.zshrc ]; then
	touch ~/.zshrc
fi
echo "source .zsh/.zshrc" >> ~/.zshrc

# Prompt
git submodule update --init

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Source all the alias and exports
source ~/.zshrc

# Sync brew plugins
## sidenote, the reason to not use Brewfile (brew bundle) is that
## more plugins will be installed after the installation by the user, and those plugin will not be reflected in the Brewfile
## which might make it hard to manage
brew install bat
brew install diff-so-fancy
brew install fzf
brew install kubectx
brew install wget
brew install 1password-cli
brew install zoxide
brew install eza 
brew install jq
brew install direnv
brew install asdf

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


echo "All the auto configurable stuffs is installed, please config yourself for the following manual configuration"
echo "1. 1password cli plugins for specific usecase https://developer.1password.com/docs/cli/shell-plugins/"
echo "2. aws cli https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
