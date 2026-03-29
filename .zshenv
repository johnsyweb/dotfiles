
export EDITOR="vim"

export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"

if [[ -r ${HOME}/.zshenv.${HOST%%.*} ]]; then
    . ${HOME}/.zshenv.${HOST%%.*}
fi

if [[ -r ${HOME}/.zshenv.${OSTYPE%%.*} ]]; then
    . ${HOME}/.zshenv.${OSTYPE%%.*}
fi

if [[ "${AWS_VAULT}" ]] ; then
    export WINDOW="${AWS_VAULT} [${AWS_REGION:-No region}]"
fi

[[ -d /usr/local/bin ]] && export PATH=${PATH}:/usr/local/bin
