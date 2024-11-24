# TUI + ZSH + CLI Tool configuration

## Intended to use with
- [warp](https://www.warp.dev/)
- zsh (macos native shell)

## Prompt 
- [kube-ps1](https://github.com/jonmosco/kube-ps1)
- [git-prompt](https://github.com/woefe/git-prompt)
- zsh native prompt time

![prompt](prompt/prompt_example.png)

## Plugins
All plugins for now are installed through brew, see installation.zsh for full list

# Installation
1. git clone this repo into .zsh/
2. git init and update all submodules
3. Download warp
4. Run .zsh/installation.zsh
5. Run the manual config part if needed

## Exports
Add your exports under exports.zsh, it is ignored by git. The reason is based on different usage, plugins installed in different system can be vastly different

## Alias
All alias is managed under alias/, feel free to add / change the zsh files. A simple pull and re-source will sync the changes.

## Warp need to fix something before i can use the below
- [atuin](https://docs.atuin.sh/)
  - [bindkey in zsh does not work in warp](https://github.com/warpdotdev/Warp/issues/537)
- [tmux](https://github.com/tmux/tmux/wiki/Getting-Started)
  - [tmux is supported by warp, but all the warp features will be gone](https://github.com/warpdotdev/Warp/discussions/501)

## TODO
- local env setup
