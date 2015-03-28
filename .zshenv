unsetopt GLOBAL_RCS

export EDITOR="vim"
export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
export PATH=".git/safe/../../bin:${PATH}"
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"

if [[ -r ${HOME}/.zshenv.${HOST%%.*} ]]; then
  . ${HOME}/.zshenv.${HOST%%.*}
fi

if [[ -r ${HOME}/.zshenv.${OSTYPE%%.*} ]]; then
  . ${HOME}/.zshenv.${OSTYPE%%.*}
fi

