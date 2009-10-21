" vim plugin for cvs diff 
" description:
"   vim plugin to use vim split diff on cvs
" maintainer:  Eric Ji <eji@yahoo-inc.com>
"
" usage:
" 1) install
"    copy this file to your vim plugin directory, normally ~/.vim/plugin
"    if not, can manally source this file in vim or add into ~/.vimrc
"    :source cvsdiff.vim
" 2) used as vim command, format :Cvsdiff [v] [version #]
"    :Cvsdiff     
"       -- diff between opened file and lastest cvs version, horizontal split
"    :Cvsdiff     
"       -- diff between opened file and lastest cvs version, vertical split
"    :Cvsdiff <version #>  example  :Cvsdiff 1.2
"       -- diff between opened file and cvs version #, horizontal split
"    :Cvsdiff v <version #>  example  :Cvsdiff v 1.2
"       -- diff between opened file and cvs version #, vertical split
" 3) map to key 
"    can create mapping in ~/.vimrc, example
"    a. map <F8> <Plug>Cvsdiff
"         -- press F8 in vim, show diff to cvs last version, horizontal split
"    b. map <F7> <Plug>Cvsdiffv
"         -- press F8 in vim, show diff to cvs last version, vertical split
" 4) return from diff mode to normal mode
"    :set nodiff

if exists("loaded_cvsdiff") || &cp
    finish
endif
let loaded_cvsdiff = 1

noremap <unique> <script> <Plug>Cvsdiff :call <SID>Cvsdiff()<CR>
noremap <unique> <script> <plug>Cvsdiffv :call <SID>Cvsdiff("v")<CR>
com! -bar -nargs=? Cvsdiff :call s:Cvsdiff(<f-args>)

function! s:Cvsdiff(...)
    if a:0 > 1
        let rev = a:2
    else
        let rev = ''
    endif

    let ftype = &filetype
    let tmpfile = tempname()
    let cmd = "cat " . bufname("%") . " > " . tmpfile
    let cmd_output = system(cmd)
    let tmpdiff = tempname()
    let cmd = "cvs diff" . rev . " " . bufname("%") . " > " . tmpdiff
    let cmd_output = system(cmd)
    if v:shell_error && cmd_output != ""
        echohl WarningMsg | echon cmd_output 
        return
    endif

    """" 20070418paj Solaris' `patch` syntax is different...
        let cmd = "patch -R -p0 -i " . tmpdiff . " " . tmpfile
    """"let cmd = "patch -R -p0 " . tmpfile . " " . tmpdiff

    let cmd_output = system(cmd)
    if v:shell_error && cmd_output != ""
        echon cmd . "... " | echohl WarningMsg | echon cmd_output 
        return
    endif

    if a:0 > 0 && a:1 == "v"
        exe "vert diffsplit" . tmpfile
    else
        exe "diffsplit" . tmpfile
    endif  

    exe "set filetype=" . ftype
endfunction

