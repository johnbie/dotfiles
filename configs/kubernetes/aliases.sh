alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
# alias kc="kubectx
# alias kns="kubens

alias kw="watch -n 1 \"kubectl get pods -n \$(kubectl get ns | awk '{print \$1}' | fzf)\""

