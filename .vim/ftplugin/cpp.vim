let c_no_curly_error=1
if executable('clang++')
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = ' -std=c++11 --analyze '
endif

nnoremap <Leader>c   :?^\s*case? mark k\|echo getline("'k")<CR>

setlocal nospell
