alias cat="bat"
alias cd="z"
alias cdi="zi"

bencode() {
  echo -n $1 | openssl base64
}