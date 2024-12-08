alias ga='git commit --amend --no-edit'

gpu() {
    git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
}
