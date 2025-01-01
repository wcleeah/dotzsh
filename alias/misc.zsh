alias cd="z"
alias cdi="zi"
alias ls="eza"
alias o.="open ."
alias c="clear"
alias t="tmux-sessionizer"
alias n="nvim ."

bencode() {
  echo -n $1 | openssl base64
}

alias v="nvim"
alias a="atac -d $(pwd)"

an() {
    TARGET=$(find ~/Documents -type d -maxdepth 1 | fzf)
    DIR_NAME=$(basename $TARGET)
    EXISTS=$(aerospace list-workspaces --all --format %{workspace} | grep $DIR_NAME)
    if [[ "$EXISTS" == "$DIR_NAME" ]]; then
        echo "Workspace $DIR_NAME already exists, switching to it"
        aerospace workspace "$DIR_NAME"
        return
    fi
    CURR_WIN=$(aerospace list-windows --focused)
    yq e -i ".windows[].tabs[0].title = \"$DIR_NAME (NVIM)\" | .windows[].tabs[1].title = \"$DIR_NAME\" | .windows[].tabs[0].layout.cwd = \"$TARGET\" | .windows[].tabs[1].layout.cwd = \"$TARGET\"" ~/.warp/launch_configurations/lan.yaml
    open "warp://launch/Lan"
    until [[ "$(aerospace list-windows --focused)" != "$CURR_WIN" ]]; do sleep 1; done
    aerospace move-node-to-workspace "$DIR_NAME"
    aerospace workspace "$DIR_NAME"
}

aw() {
    TARGET=$(aerospace list-workspaces --all --format %{workspace} | fzf)
    aerospace workspace "$TARGET"
}
