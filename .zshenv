unsetopt GLOBAL_RCS

export EC2_HOME=${HOME}/.ec2
export EDITOR="vim"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
typeset -U path
path=(
    ~/.rbenv/shims
    ~/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/share/python
    $path
    ${EC2_HOME}/bin
)
path=($^path(N-/))
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"

if type rbenv &> /dev/null; then
    eval "$(rbenv init -)"
fi

if [[ -r /opt/boxen/env.sh ]]; then
    . /opt/boxen/env.sh
fi

if [[ -r ${HOME}/.zshenv.${HOST%%.*} ]]; then
  . ${HOME}/.zshenv.${HOST%%.*}
fi

if [[ -r ${HOME}/.zshenv.${OSTYPE%%.*} ]]; then
  . ${HOME}/.zshenv.${OSTYPE%%.*}
fi
