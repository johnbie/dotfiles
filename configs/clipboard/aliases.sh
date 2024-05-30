alias xclipi='xclip -selection c'
alias xclipo='xclip -selection c -o'
alias xclipjq='xclipo | jq . | xclipi'
alias xclipjq='xclipfromjson | jq fromjson | xclipi'
