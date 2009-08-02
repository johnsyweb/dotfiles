" A Vim filetype plugin to set up PyUnit as the 'compiler' for python files.

" This sets up the errorformat...
compiler pyunit

" Set the 'makeprg', this allows you to call :make on any .py file and run all
" of the unit tests in the current working directory
" Ensure you have this file...
setlocal makeprg=${HOME}/bin/alltests.py

" Some useful abbreviations when writing unit tests in Python...
iabbr <buffer> sa_ self.assert_
iabbr <buffer> sae self.assertEquals
iabbr <buffer> saf self.assertFalse
iabbr <buffer> san self.assertNotEquals
iabbr <buffer> sar self.assertRaises
iabbr <buffer> sat self.assertTrue

" Preferences for spaces, etc...
setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab smartindent

setlocal indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except,0#

function! GetLastClass(which_line)
    "My answer to http://groups.google.com/group/vim_use/browse_thread/thread/a7f50c597223e4ef
    let l:retval = "None"
    let l:class_regex = 'class\s\+\zs\i\+' 

    let l:this_line = getline(a:which_line)
    let l:indentation = matchstr(l:this_line, '^\s*')

    let l:last_class_regex = '^\(' . l:indentation . '\)\@!\s*class'
    let l:last_line_declaring_a_class = search(l:last_class_regex, 'cbnW')
    let l:last_class_indentation = matchstr(getline(l:last_line_declaring_a_class), '^\s*')

    let l:last_non_class_regex = '^\(' . l:last_class_indentation . '\)\@=\(class\)\@!\(\<\)\@='
    let l:last_non_class_block = search(last_non_class_regex, 'cbnW')

    if l:last_non_class_block < l:last_line_declaring_a_class
        let l:outer_class = ''
        if strlen(l:last_class_indentation) > 0
            let l:outer_class = GetLastClass(l:last_line_declaring_a_class)
            let l:outer_class .= '.'
        endif
        let l:retval = l:outer_class
        let l:retval .= matchstr(getline(l:last_line_declaring_a_class), l:class_regex)
    endif

    return l:retval

endfunction

setlocal statusline=[%n]\ [class\ %{GetLastClass('.')}:]\ %<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

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

