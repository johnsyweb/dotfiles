function! UsePyUnit()
    " This sets up the errorformat...
    compiler pyunit

    " Set the 'makeprg', this allows you to call :make on any .py file and run all
    " of the unit tests in the current working directory
    " Ensure you have this file...
    setlocal makeprg=${HOME}/bin/alltests.py
    set makeprg?
endfunction
nnoremap <leader>pu :call UsePyUnit()<CR>

function! UsePyLint()
    setlocal efm=%f:%l:\ [%t]%m,%f:%l:%m
    setlocal makeprg=pylint\ --reports=n\ --msg-template='{path}:{line}:\ [{msg_id}({symbol}),\ {obj}]\ {msg}'\ %
    set makeprg?
endfunction
nnoremap <leader>pl :call UsePyLint()<CR>

" Use PyUnit by Default.
call UsePyUnit()

" Some useful abbreviations when writing unit tests in Python...
iabbr <buffer> sa_ self.assert_
iabbr <buffer> sae self.assertEquals
iabbr <buffer> saf self.assertFalse
iabbr <buffer> san self.assertNotEquals
iabbr <buffer> sar self.assertRaises
iabbr <buffer> sat self.assertTrue

function! GetClassNameFromLine(line_number)
    let l:class_regex = 'class\s\+\zs\i\+'
    let l:line = getline(a:line_number)
    return matchstr(l:line, l:class_regex)
endfunction


function! GetIndentationFromLine(line_number)
    let l:line = getline(a:line_number)
    return matchstr(l:line, '^\s*')
endfunction


function! GetClassDeclarationBeforeLine(line_number)
    let l:indentation = GetIndentationFromLine(a:line_number)
    let l:last_class_regex = '^\(' . l:indentation . '\)\@!\s*class'
    return search(l:last_class_regex, 'cbnW')
endfunction


function! GetLastBlockBeforeLine(line_number)
    let l:indentation = GetIndentationFromLine(a:line_number)
    let l:last_non_class_regex = '^\(' . l:indentation . '\)\@=\(class\)\@!\(\<\)\@='
    return search(last_non_class_regex, 'cbnW')
endfunction


function! ShouldLookForOuterClass(line_number_of_class_dec)
    let l:indentation = GetIndentationFromLine(a:line_number_of_class_dec)
    return strlen(l:indentation) > 0
endfunction


function! GetLastClass(line_number)
    let l:retval = ''

    let l:line_number_of_class_dec = GetClassDeclarationBeforeLine(a:line_number)
    let l:last_non_class_block = GetLastBlockBeforeLine(l:line_number_of_class_dec)

    if l:last_non_class_block < l:line_number_of_class_dec
        if ShouldLookForOuterClass(l:line_number_of_class_dec)
            let l:retval = GetLastClass(l:line_number_of_class_dec)
            let l:retval .= '.'
        endif
        let l:retval .= GetClassNameFromLine(l:line_number_of_class_dec)
    endif

    return l:retval
endfunction

function! GetLastClassWrapper()
"My answer to http://groups.google.com/group/vim_use/browse_thread/thread/a7f50c597223e4ef
    let l:retval = 'No class:'
    let l:last_class = GetLastClass('.')
    if strlen(l:last_class)
        let l:retval = 'class ' . l:last_class . ':'
    endif
    return l:retval
endfunction

setlocal expandtab
setlocal indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except,0#
setlocal keywordprg=pydoc
setlocal shiftwidth=4
setlocal smartindent
setlocal smarttab
setlocal softtabstop=4
setlocal statusline=[%n]\ %{GetLastClassWrapper()}\ %<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
setlocal tabstop=8
setlocal textwidth=79

" Tip 1546: Automatically add Python paths to Vim path
if has('python')
python << EOF
import os
import sys
import vim
for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
        # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif"has('python')

