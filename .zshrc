ZSH=${HOME}/.oh-my-zsh

COMPLETION_WAITING_DOTS="true"
DISABLE_MAGIC_FUNCTIONS=true

plugins=(
    brew
    bundler
    capistrano
    color-ssh
    cpanm
    docker
    emacs
    gem
    git
    github
    heroku
    osx
    rails
    rake
    redis-cli
    vagrant
)

zstyle :omz:plugins:ssh-agent agent-forwarding on
source ${ZSH}/oh-my-zsh.sh
source ${HOME}/.aliases

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

IDENTITY_DEV_BOOTSTRAP_FILES="${HOME}/src/identity-dev-bootstrap/files"
if [[ -d $IDENTITY_DEV_BOOTSTRAP_FILES ]]; then
    for id_config in ${IDENTITY_DEV_BOOTSTRAP_FILES}/*.sh(.); do
        source "${id_config}"
    done
fi

if [[ -d /usr/local/share/zsh-completions ]]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

mcd() {
    mkdir $1
    cd $1
}

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
