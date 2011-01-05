" Vim filetype plugin file
" Language:     Java
" Maintainer:   Pete Johns <paj-vim@johnsy.com>
" Last Change:  4 January 2011
" URL:          https://github.com/johnsyweb/dotfiles/blob/master/.vim/ftplugin/java.vim
" Notes:        http://vimgolf.com/challenges/4d22dcfa7f75b01e0700010e
"               vG\aaZZ
"               Par 7!

function! AddAccessors()
    if match(getline("."), "private") > -1
        silent yank l
        norm ]]
        silent put! l
        silent substitute/\v.* (\i+) (\i+);/	public \1 get\u\2() { return \2; }/e
        norm ]]
        silent put! l
        silent silent substitute/\v.* (\i+) (\i+);/	public void set\u\2( \1 \2 ) {		this.\2 = \2;	}/e
        silent norm =ap
    endif
endfunction
nmap <buffer> <leader>aa :call AddAccessors()<CR>
vmap <buffer> <leader>aa :call AddAccessors()<CR>
