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
nvm use v6.0.0




export LC_CTYPE=ja_JP.UTF-8
export PGDATA=/usr/local/var/postgres

source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
