alias k8sr="vi /Users/leewingcheung/.zsh/alias/k8s.zsh"
alias refk8s="source /Users/leewingcheung/.zsh/alias/k8s.zsh"

# kubectl related
alias kgp="kubectl get pods"

kesh() {
  echo $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}')
  if [ -z "$2" ]; then
    kubectl exec -it $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}') sh
  else
    kubectl exec -it $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}') -c $2 sh
  fi
}

ke() {
  echo $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}')
  if [ -z "$2" ]; then
    kubectl exec -it $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}') bash
  else
    kubectl exec -it $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}') -c $2 bash
  fi
}

kpf() {
  echo $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}')
  kubectl port-forward pods/$(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}') 8022:22
}

krestart() {
  kubectl rollout restart deployment/$1
  while true; do kgp | awk -v d=$1 '$0 ~ d{print}'; sleep 2; clear; done
}

kst() {
  echo $(kubectl config current-context)
  echo $(kubens -c)
}

kgpl() {
  while true; do kgp; sleep 2; clear; done
}

ked() {
  if [ "$1" = "cc"  ]; then
    kubectl edit cm $2-custom-env
  elif [ "$1" = "c" ]; then
    kubectl edit cm $2-env
  elif [ "$1" = "sc" ]; then
    kubectl edit secret $2-custom-env
  elif [ "$1" = "s" ]; then
    kubectl edit secret $2-env
  fi
}

kg() {
  kubectl get $1 $2 -o=yaml
}


kdes() {
  kubectl describe $1 $2
}


klog() {
  echo $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}')
  if [ -z "$2" ]; then
    kubectl logs -f $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}') 
  else
    kubectl logs -f $(kgp | awk -v d=$1 '$0 ~ d{print $1; exit;}') -c $2 
  fi
}
