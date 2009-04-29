"        File: mail.vim
" Description: Settings, commands and mappings for mail files.
"  Maintainer: Pete Johns <paj-vim@johnsy.com>
"         URL: http://johnsy.com/dotfiles/.vim/ftplugin/mail.vim
"     Version: 1.0
" Last Change: 2006-05-16

set verbose=10

" Only do this when not done yet for this buffer
if exists("b:pajmailplugin")
  echo "b:pajmailplugin"
  finish
else
    echo "no b:pajmailplugin"
endif
let b:pajmailplugin = 1

let b:undo_ftplugin = "setl modeline< tw< fo<"

" Don't use modelines in e-mail messages, avoid trojan horses
setlocal nomodeline

setlocal tw=65

" Set 'formatoptions' to break text lines and keep the comment leader ">".
setlocal fo+=tcql

" Add mappings, unless the user didn't want this.
if !exists("no_plugin_maps") && !exists("no_mail_maps")
  " Quote text by inserting "> "
  if !hasmapto('<Plug>MailQuote')
    vmap <buffer> <LocalLeader>q <Plug>MailQuote
    nmap <buffer> <LocalLeader>q <Plug>MailQuote
  endif
  vnoremap <buffer> <Plug>MailQuote :s/^/> /<CR>:noh<CR>``
  nnoremap <buffer> <Plug>MailQuote :.,$s/^/> /<CR>:noh<CR>``
endif

set verbose=0

unlet b:pajmailplugin
