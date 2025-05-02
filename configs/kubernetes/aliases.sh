alias kube-watch-pod="watch -n 1 \"kubectl get pods -n \$(kubectl get ns | awk '{print \$1}' | fzf)\""

