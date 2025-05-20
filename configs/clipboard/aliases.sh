alias xclipi='xclip -selection c' # input
alias xclipo='(xclip -selection c -o | tr -d "\r"; echo)' # output
xclipm() { xclipo | "$@" | xclipi; }
alias xclipjq='xclipo | jq . | xclipi'
alias xclipjs='xclipo | jq fromjson | xclipi'
