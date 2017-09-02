if [[ -r /opt/boxen/env.sh ]]; then
    . /opt/boxen/env.sh
fi

ZSH=${HOME}/.oh-my-zsh

COMPLETION_WAITING_DOTS="true"

plugins=(
    autojump
    brew
    bundler
    capistrano
    color-ssh
    cpanm
    docker
    gem
    git
    gnu-utils
    heroku
    osx
    pip
    pow
    powder
    profiles
    python
    rails
    rake
    rbenv
    redis-cli
    safe-paste
    ssh-agent
    svn
    terminalapp
    tmuxinator
    vagrant
    zeus
)

zstyle :omz:plugins:ssh-agent agent-forwarding on
source ${HOME}/.zshenv
source ${ZSH}/oh-my-zsh.sh
source ${HOME}/.aliases

mcd() {
    mkdir $1
    cd $1
}

setopt nobeep
setopt braceccl
setopt noclobber
setopt completealiases
setopt cshjunkiehistory
setopt extendedglob
setopt globcomplete
setopt globsubst
setopt histallowclobber
setopt nohup
setopt nolistambiguous
setopt nolistbeep
setopt magicequalsubst
setopt monitor
setopt numericglobsort
setopt pathdirs
setopt posixbuiltins
setopt nopromptcr
setopt pushdsilent
setopt pushdtohome
setopt rcexpandparam
setopt shoptionletters
setopt zle

autoload -U promptinit
promptinit
prompt clint

alias bi='bundle install --local'
alias make_bin_safe='mkdir -p .git/safe'
alias make_bin_unsafe='rm -r .git/safe'
