for ve in rbenv pyenv; do
    if type ${ve} &> /dev/null; then
        eval "$(${ve} init -)"
    fi
done

unsetopt GLOBAL_RCS

export EC2_HOME=${HOME}/.ec2
export EDITOR="vim"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
typeset -U path
path=(
    ~/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/share/python
    $path
    ${EC2_HOME}/bin
)
path=($^path(N-/))
export PATH=".git/safe/../../bin:${PATH}"
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"

if [[ -r /opt/boxen/env.sh ]]; then
    . /opt/boxen/env.sh
fi

tmuxinator_completion="${HOME}/src/tmuxinator/completion/tmuxinator.zsh"
if [[ -r ${tmuxinator_completion} ]]; then
    . ${tmuxinator_completion}
fi

if [[ -r ${HOME}/.zshenv.${HOST%%.*} ]]; then
  . ${HOME}/.zshenv.${HOST%%.*}
fi

if [[ -r ${HOME}/.zshenv.${OSTYPE%%.*} ]]; then
  . ${HOME}/.zshenv.${OSTYPE%%.*}
fi

