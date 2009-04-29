" Vim global plug-in for toggling between source and unit test files.
" Last Change:	2009 January 01
" Maintainer:	Pete Johns <paj-vim@johnsy.com>
" License:	    This file is placed in the public domain.

if exists('g:loaded_toggle_unit_tests')
    finish
endif
let g:loaded_toggle_unit_tests = 1

if v:version < 700
    echohl WarningMsg|echomsg 'Toggle Unit Tests requires at least VIM 7.0'|echohl None
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

if !hasmapto('<Plug>ToggleUnitTestsToggle')
    map <unique> <Leader>tut  <Plug>ToggleUnitTestsToggle
endif
noremap <unique> <script> <Plug>ToggleUnitTestsToggle  <SID>Toggle

noremenu <script> Plugin.Toggle\ Unit\ Tests      <SID>Toggle

noremap <SID>Toggle  :call <SID>Toggle()<CR>

if !exists('g:unit_test_prefix')
    let g:unit_test_prefix = 't_'
endif

function s:Toggle()
    " This function assumes source and unit test files are in the same
    " directory, as I believe this to be best practice.
    
    " Little point executing if there's no file open.
    if expand('%') == ''
        echohl WarningMsg|echomsg 'No file open.'|echohl None
        return
    endif

    " Write file if necessary.
    update

    " Determine alternative filename.
    let l:unit_test_regex = '^'.g:unit_test_prefix
    if expand('%:e') == 'h'
        "For C++ header files, deliver to corresponding source.
        for extension in ['cxx', 'cc', 'C', 'c++', 'SC', 'c', 'cpp']
            let l:alternate = expand('%:t:r').'.'.extension
            if file_readable(l:alternate)
                break
            endif
        endfor
    elseif expand('%:t') =~ l:unit_test_regex
        "This is the unit test, remove the prefix.
        let l:alternate = substitute(expand('%:t'), l:unit_test_regex, '', '')
    else
        "This is the SUT, prepend 't_'.
        let l:alternate = g:unit_test_prefix.expand('%:t')
    endif

    " Open the file.
    execute 'edit '.expand('%:p:h').'/'.l:alternate
endfunction

if !exists(":TUT")
    command -nargs=0  TUT  :call s:Toggle()
endif

let &cpo = s:save_cpo

