alias xclipi='xclip -selection c'
alias xclipo='(xclip -selection c -o | tr -d "\r"; echo)'
alias xclipjq='xclipo | jq . | xclipi'
alias xclipjs='xclipo | jq fromjson | xclipi'
