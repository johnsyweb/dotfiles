unsetopt GLOBAL_RCS

if [[ -x '/Applications/Emacs.app/Contents/MacOS/bin/emacsclient' ]]; then
    export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
else
    export EDITOR="vim"
fi
export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
export PATH="${HOME}/bin:.git/safe/../../bin:/usr/sbin:${PATH}"
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"

if [[ -r ${HOME}/.zshenv.${HOST%%.*} ]]; then
  . ${HOME}/.zshenv.${HOST%%.*}
fi

if [[ -r ${HOME}/.zshenv.${OSTYPE%%.*} ]]; then
  . ${HOME}/.zshenv.${OSTYPE%%.*}
fi

export LDFLAGS="${LDFLAGS} -L$(/usr/local/bin/brew --prefix openssl)/lib"
export CPPFLAGS="${CPPFLAGS} -I$(/usr/local/bin/brew --prefix openssl)/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} $(/usr/local/bin/brew --prefix openssl)/lib/pkgconfig"

for brew_override in openssl; do
      export PATH="$(/usr/local/bin/brew --prefix ${brew_override})/bin":${PATH}
done
