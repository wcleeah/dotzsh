alias gl='git log --oneline --graph'

gpu() {
    git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
}

ga() {
    git add .
    git commit --amend --no-edit
}

