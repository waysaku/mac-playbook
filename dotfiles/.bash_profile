### Aliases

alias hb='hub browse'

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias ll="l"
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Git 
# You must install Git first - ""
alias gs='git status'
alias ga='git add .'
alias gk='git checkout'
alias gb='git branch'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'



# Only show the current directory's name in the tab 
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'


source ~/.nvm/nvm.sh
nvm use v0.11.12



export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/a11068/.boot2docker/certs/boot2docker-vm



export PGDATA=/usr/local/var/postgres
export LANG=ja_JP.UTF-8


PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
