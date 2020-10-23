unsetopt GLOBAL_RCS

export EMACSCLIENT='/usr/local/bin/emacsclient'
if [[ -x ${EMACSCLIENT} ]]; then
    export EDITOR=${EMACSCLIENT}
else
    export EDITOR="vim"
fi

export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
export PATH="${HOME}/bin:/usr/local/bin:/sbin:/usr/local/sbin:.git/safe/../../bin:/usr/sbin:${PATH}"
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"

if [[ -d "${HOME}/.local/bin" ]]; then
    export PATH="${HOME}/bin:.git/safe/../../bin:/usr/sbin:${HOME}/.local/bin:${PATH}"
fi

if [[ -r ${HOME}/.zshenv.${HOST%%.*} ]]; then
    . ${HOME}/.zshenv.${HOST%%.*}
fi

if [[ -r ${HOME}/.zshenv.${OSTYPE%%.*} ]]; then
    . ${HOME}/.zshenv.${OSTYPE%%.*}
fi

for brew_override in openssl 'postgresql@9.6' 'mysql@5.6'; do
    prefix=/usr/local/opt/${brew_override}
    export LDFLAGS="${LDFLAGS} -L${prefix}/lib"
    export CPPFLAGS="${CPPFLAGS} -I${prefix}/include"
    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} ${prefix}/lib/pkgconfig"
    export PATH="${prefix}/bin":${PATH}
done

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ "${AWS_VAULT}" ]] ; then
    export WINDOW="${AWS_VAULT} [${AWS_REGION:-No region}]"
fi
