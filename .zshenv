export EC2_HOME=${HOME}/.ec2
export EDITOR="vim"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export LESS="-FMRX"
export LESSOPEN="|lesspipe.sh %s"
export PATH=${HOME}/.rbenv/bin:/usr/local/bin:${PATH}
export PATH=${PATH}:${EC2_HOME}/bin
export TEMP="${HOME}/tmp"
export VISUAL="${EDITOR}"
if [[ -r ${HOME}/.zshenv.${HOST%%.*} ]]; then
  . ${HOME}/.zshenv.${HOST%%.*}
fi

if [[ -r ${HOME}/.zshenv.${OSTYPE%%.*} ]]; then
  . ${HOME}/.zshenv.${OSTYPE%%.*}
fi
