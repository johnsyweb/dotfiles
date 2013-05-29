ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(
    autoenv
    brew
    bundler
    capistrano
    color-ssh
    cpanm
    gem
    git
    osx
    pip
    pow
    powder
    profiles
    python
    rails3
    rake
    rbenv
    redis-cli
    ssh-agent
    svn
    terminalapp
    virtualenv
    zeus
)

zstyle :omz:plugins:ssh-agent agent-forwarding on

source ${ZSH}/oh-my-zsh.sh
source ${HOME}/.aliases
source ${HOME}/.zshenv

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

