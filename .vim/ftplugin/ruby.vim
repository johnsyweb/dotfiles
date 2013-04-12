compiler rspec
setlocal expandtab
setlocal foldmethod=manual
setlocal keywordprg=ri
setlocal shiftwidth=2
setlocal smartindent
setlocal smarttab
setlocal softtabstop=2
setlocal tabstop=8
setlocal textwidth=79

function! s:IsConfigFile(filename)
  return match(a:filename, "/config/") > 1
endfunction

function! s:RestartApp()
  let l:filename = substitute(expand("%:p"), '\c^file://', '', '')
  if s:IsConfigFile(l:filename)
    let l:restart_file = substitute(l:filename, '/config/.*', '/tmp/restart.txt', '')
    let l:cmd = 'touch ' . shellescape(l:restart_file)
    let l:result = system(l:cmd)
    if v:shell_error
      echoerr 'Failed to kick Pow "' . l:result . '" (' . v:shell_error .')'
    else
      echomsg 'Pow should now restart your app'
    endif
  endif
endfunction

autocmd! BufWritePost *.rb call s:RestartApp()

