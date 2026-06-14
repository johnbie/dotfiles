# ssh-agent helpers
# Quick manual re-add of the primary key when the agent has dropped it
# (e.g. a fresh agent in a non-interactive context). Normally unnecessary —
# autoload/load_ssh_agent.sh adds it on shell init and ~/.ssh/config's
# AddKeysToAgent loads it on first use.
alias sshkey='ssh-add ~/.ssh/id_ed25519'
alias sshkeys='ssh-add -l'
