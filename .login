### Startup for LOGIN
### Customize this to suit your needs

source /usr/local/standard.login

source .aliases
# yes we set path in .login as well as .cshrc, because the above standard.login
# hijacks it. God damn it.
switch (`uname -p`)
case "i386":
    set local="${mrchome}/local-x86"
    setenv LD_LIBRARY_PATH "/home/NYtree/server/SunOS5.10-i86pc_local/app/sybase_oc/OCS-12_5/OCS-12_5/lib:${LD_LIBRARY_PATH}"
    setenv PATH "${pajhome}/bin:${mrchome}/bin:${local}/bin:${local}/sbin:{$dpchome}/bin/i386:/usr/local-x86/bin:/usr/ccs/bin:/usr/atria/bin:${PATH}"
    setenv LD_LIBRARY_PATH "${local}/lib:/usr/local-x86/lib:${LD_LIBRARY_PATH}"
    breaksw
default:
    set local="${mrchome}/local-`uname -p`"
    setenv PATH "${mrchome}/bin:${local}/bin:${pajhome}/bin:${dpchome}/bin/sparc:/usr/local/bin:/usr/ccs/bin:/usr/atria/bin:${PATH}"
    setenv LD_LIBRARY_PATH "${local}/lib:/usr/local/lib:${LD_LIBRARY_PATH}"
    breaksw
endsw

setenv GIT_PAGER "less -RF -- "
setenv PAGER less
setenv MANPATH "${MANPATH}:${local}/man:${local}/share/man"

# add git branch to prompt (only switches when prompt alias is rerun, e.g. by cd)
setenv GIT_BRANCH_CMD "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'"
alias prompt 'set prompt = "%{\033[0m%}%n@${SHORTHOST}(${ENV_MODE}) `$GIT_BRANCH_CMD` %c3% "'
prompt
