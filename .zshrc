ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(
    autoenv
    brew
    bundler
    capistrano
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
    redis
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
