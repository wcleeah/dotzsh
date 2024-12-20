alias ga='git commit --amend --no-edit'
alias gl='git log --oneline --graph'

gpu() {
    git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
}
