" Vim global plug-in for toggling between source and unit test files.
" Last Change:	2009 January 01
" Maintainer:	Pete Johns <paj-vim@johnsy.com>
" License:	    This file is placed in the public domain.
" Notes:        This plugin assumes source and unit test files are in the same
"               directory, as I believe this to be best practice.


if exists('g:loaded_toggle_unit_tests')
    finish
endif
let g:loaded_toggle_unit_tests = 1


function! s:EchoWarning(msg)
    echohl WarningMsg
    echomsg a:msg
    echohl None
endfunction


if v:version < 700
    call s:EchoWarning('Toggle Unit Tests requires at least VIM 7.0')
    finish
endif


let s:save_cpo = &cpo
set cpo&vim


if !hasmapto('<Plug>ToggleUnitTestsToggle')
    map <unique> <Leader>tut  <Plug>ToggleUnitTestsToggle
endif
noremap <unique> <script> <Plug>ToggleUnitTestsToggle  <SID>Toggle
noremap <SID>Toggle  :call <SID>Toggle()<CR>
noremenu <script> Plugin.Toggle\ Unit\ Tests      <SID>Toggle


if !exists('g:unit_test_prefix')
    let g:unit_test_prefix = 't_'
endif


function! s:NoFileOpen()
    return expand('%') == ''
endfunction


function! s:WriteFileIfNecessary()
    update
endfunction


function! s:CurrentFileIsCppHeader()
   return expand('%:e') == 'h' 
endfunction


function! s:GetCppSourceForHeader()
    for l:extension in ['cxx', 'cc', 'C', 'c++', 'SC', 'c', 'cpp']
        let l:alternate = expand('%:t:r').'.'. l:extension
        if file_readable(l:alternate)
            break
        endif
    endfor

    return l:alternate
endfunction


function! s:CurrentFileIsTest()
    let l:unit_test_regex = '^'.g:unit_test_prefix
    return expand('%:t') =~ l:unit_test_regex 
endfunction


function! s:GetSutFromTest()
    let l:unit_test_regex = '^'.g:unit_test_prefix
    return substitute(expand('%:t'), l:unit_test_regex, '', '')
endfunction


function! s:GetTestFromSut()
    return g:unit_test_prefix.expand('%:t')
endfunction


function! s:DetermineAlternativeFilename()
    if s:CurrentFileIsCppHeader()
        let l:alternate = s:GetCppSourceForHeader()
    elseif s:CurrentFileIsTest()
        let l:alternate = s:GetSutFromTest()
    else
        let l:alternate = s:GetTestFromSut()
    endif
    return l:alternate
endfunction


function! s:OpenFileInCurrentDirectory(filename)
    let l:full_path = expand('%:p:h') . '/' . a:filename
    let l:command = 'edit' . l:full_path
    execute l:command
endfunction


function! s:Toggle()
    if s:NoFileOpen()
        call s:EchoWarning('No file open.')
        return
    endif

    call s:WriteFileIfNecessary()

    let l:alternate = s:DetermineAlternativeFilename()

    call s:OpenFileInCurrentDirectory(l:alternate)
endfunction


if !exists(":TUT")
    command -nargs=0  TUT  :call s:Toggle()
endif


let &cpo = s:save_cpo
