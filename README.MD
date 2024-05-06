# CLI configuration (actually is for terminal) for me

## Intended to use with
- [warp](https://www.warp.dev/)
- zsh (macos native shell)

## Prompt 
- [kube-ps1](https://github.com/jonmosco/kube-ps1)
- [git-prompt](https://github.com/woefe/git-prompt)
- zsh native prompt time

![prompt](prompt/prompt_example.png)

## Plugins
All plugins for now are installed through brew:
- [bat](https://github.com/sharkdp/bat)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy/tree/next)
- [fzf](https://github.com/junegunn/fzf)
- [kubectx](https://github.com/ahmetb/kubectx)
- [wget](https://formulae.brew.sh/formula/wget)
- [1password-cli](https://developer.1password.com/docs/cli/get-started/#install)
- [zoxide](https://github.com/ajeetdsouza/zoxide)


## Installation
1. git clone this repo
2. Download warp
3. Run .zsh/installation.zsh
4. Run the manual config part if needed

## Exports
Add your exports under exports.zsh, it is ignored by git. The reason is based on different usage, plugins installed in different system can be vastly different

## Alias
All alias is managed under alias/, feel free to add / change the zsh files. A simple pull and re-source will sync the changes.


