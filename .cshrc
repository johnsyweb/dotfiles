# Customize this file to suit your needs
source /usr/local/standard.cshrc
source /home/Glue/dev/etc/env/GLUEITG_ENV
source /home/Glue/dev/etc/env/GLUEGEN_ENV
source /home/Glue/dev/etc/env/COMMON_ENV

alias ct /usr/atria/bin/cleartool
alias sv '/usr/atria/bin/cleartool setview'

if ( $?tcsh ) then
    alias prompt 'set prompt = "%{\033[0m%}%n@${SHORTHOST}(${ENV_MODE}) %c3% "'
endif

setenv mrchome ~mcurtis
setenv pajhome ~pxj
setenv dpchome ~dcollins

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

bindkey ^r i-search-back
bindkey ^w backward-delete-word

setenv CONFIG_PREFIX "${local}"
setenv NCPUS `kstat -p unix:0:system_misc:ncpus | cut -f 2`
setenv DMAKE_MAX_JOBS ${NCPUS}
setenv DMAKE_MODE parallel
setenv EDITOR "vim -X"
setenv INFOPATHS "${local}/info:${local}/share/info"
setenv LESS "FRSX"
setenv PATH ${PATH}:/usr/openwin/bin:/usr/X11R6/bin/
setenv SUN_MAKE_COMPAT_MODE SUN
setenv TERM xterm
setenv TERMINFO ${mrchome}/.terminfo
setenv VISUAL "${EDITOR}"

source ${mrchome}/complete 
