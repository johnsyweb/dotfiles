" vim plugin for cc diff 
" description:
"   vim plugin to use vim split diff on cc
"
" usage:
" 1) install
"    copy this file to your vim plugin directory, normally ~/.vim/plugin
"    if not, can manally source this file in vim or add into ~/.vimrc
"    :source ccdiff.vim
" 2) used as vim command, format :ccdiff [v] [version #]
"    :ccdiff     
"       -- diff between opened file and lastest cc version, horizontal split
"    :ccdiff     
"       -- diff between opened file and lastest cc version, vertical split
"    :ccdiff <version #>  example  :ccdiff 1.2
"       -- diff between opened file and cc version #, horizontal split
"    :ccdiff v <version #>  example  :ccdiff v 1.2
"       -- diff between opened file and cc version #, vertical split
" 3) map to key 
"    can create mapping in ~/.vimrc, example
"    a. map <F8> <Plug>ccdiff
"         -- press F8 in vim, show diff to cc last version, horizontal split
"    b. map <F7> <Plug>ccdiffv
"         -- press F8 in vim, show diff to cc last version, vertical split
" 4) return from diff mode to normal mode
"    :set nodiff

if exists('loaded_ccdiff') || &cp
    finish
endif
let loaded_ccdiff = 1

noremap <unique> <script> <Plug>ccd :call <SID>ccdiff()<CR>
noremap <unique> <script> <plug>ccdv :call <SID>ccdiff('v')<CR>
com! -bar -nargs=? Ccdiff :call s:ccdiff(<f-args>)

function! s:ccdiff(...)
    if a:0 > 1
        let revision = a:2
    else
        let revision = '-pred'
    endif

    let file_type = &filetype
    let temp_file = tempname()
    let command = 'cat ' . bufname('%') . ' > ' . temp_file
    let command_output = system(command)
    let temp_diff = tempname()
    let command = 'cct diff -diff ' . revision . ' ' . bufname('%') . ' > ' . temp_diff
    let command_output = system(command)
    if v:shell_error && command_output != ''
        echohl WarningMsg | echon command_output 
        return
    endif

        let command = 'patch -R -p0 -i ' . temp_diff . ' ' . temp_file

    let command_output = system(command)
    if v:shell_error && command_output != ''
        echon command . '... ' | echohl WarningMsg | echon command_output 
        return
    endif

    if a:0 > 0 && a:1 == 'v'
        exe 'vert diffsplit' . temp_file
    else
        exe 'diffsplit' . temp_file
    endif  

    exe 'set filetype=' . file_type
endfunction

