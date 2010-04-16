" Vim global plug-in for running git grep.
" Last Change:  Wed  2 Dec 2009 16:46:13 AEST
" Maintainer:   Matt Curtis <matt.r.curtis@gmail.com>
" License:      This file is placed in the public domain.
" Notes:        stolen from http://vim.wikia.com/wiki/Git_grep


if exists('g:git_grep')
    finish
endif
let g:git_grep = 1

func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

func GitGrepWord()
  normal! "zyiw"
  call GitGrep('-w -e ', getreg('z'))
endf
nmap <C-x>G :call GitGrepWord()<CR>


