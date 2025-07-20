# ~/.zsh/aliases.zsh - Personal aliases

# ------------------------------------------------------------------------------
# GENERAL
# ------------------------------------------------------------------------------
alias l='ls -al'
alias zshconfig="$EDITOR ~/.zshrc"
alias reload="exec zsh"

# ------------------------------------------------------------------------------
# GIT (minimal essentials)
# ------------------------------------------------------------------------------
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# ------------------------------------------------------------------------------
# TASK MANAGEMENT
# ------------------------------------------------------------------------------
alias t='task'
alias ta='task add'
tm() { task "$1" modify "${@:2}" }
td() { task "$1" done }

# ------------------------------------------------------------------------------
# KUBERNETES (optional - only if kubectl is installed)
# ------------------------------------------------------------------------------
if command -v kubectl &> /dev/null; then
    alias k='kubectl'
    source <(kubectl completion zsh)
fi