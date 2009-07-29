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

function! GetIndentationLevel(line_number)

endfunction

function! GetLastClass()
    "My answer to http://groups.google.com/group/vim_use/browse_thread/thread/a7f50c597223e4ef
    let l:retval = "[No class]"

    let l:last_line_declaring_a_class = search('^\s*class', 'cbnW')
    let l:last_line_starting_with_a_word_other_than_class = search('^\(\<\)\@=\(class\)\@!', 'bnW')

    if l:last_line_starting_with_a_word_other_than_class < l:last_line_declaring_a_class
        let l:retval = getline(l:last_line_declaring_a_class)
    endif

    return l:retval
endfunction

setlocal statusline=[%n]\ %{GetLastClass()}\ %<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

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

