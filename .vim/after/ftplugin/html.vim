set textwidth=80
set formatoptions=tcrq
" This is the magic for making a backup of what I enter into a <textarea>...
autocmd BufWrite,BufLeave *w3m*  execute "write! ".expand("<afile>").".backup"

