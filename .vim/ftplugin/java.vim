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
nnoremap <buffer> <leader>aa :call AddAccessors()<CR>
vnoremap <buffer> <leader>aa :call AddAccessors()<CR>

set errorformat=\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m

