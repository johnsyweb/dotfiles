COMPLETION_WAITING_DOTS="true"
DISABLE_MAGIC_FUNCTIONS=true

plugins=(
    brew
    bundler
    color-ssh
    docker
    fzf
    gh
    kube-ps1
    kubectl
    macos
    mise
    vscode
)

ZSH=${HOME}/.oh-my-zsh
source ${ZSH}/oh-my-zsh.sh
source ${HOME}/.aliases

setopt nobeep
setopt   braceccl
setopt noclobber
setopt   completealiases
setopt   cshjunkiehistory
setopt   extendedglob
setopt   globcomplete
setopt   globsubst
setopt   histallowclobber
setopt nohup
setopt nolistambiguous
setopt nolistbeep
setopt   magicequalsubst
setopt   monitor
setopt   numericglobsort
setopt   pathdirs
setopt   posixbuiltins
setopt nopromptcr
setopt   pushdsilent
setopt   pushdtohome
setopt   rcexpandparam
setopt   shoptionletters
setopt   zle

autoload -U promptinit
promptinit
prompt clint

autoload -Uz compinit
compinit
