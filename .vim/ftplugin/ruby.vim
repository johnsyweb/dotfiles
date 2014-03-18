setlocal expandtab
setlocal foldmethod=manual
setlocal iskeyword+=!,?,=
setlocal keywordprg=ri
setlocal shiftwidth=2
setlocal smartindent
setlocal smarttab
setlocal softtabstop=2
setlocal tabstop=8
setlocal textwidth=79

let g:syntastic_ruby_checkers = ['mri', 'rubocop']

inoreabbrev pry! require 'pry'; binding.pry
