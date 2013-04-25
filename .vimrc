"        File: .vimrc [Vim resource script]
" Description: Settings, commands and mappings for Vim
"  Maintainer: Pete Johns <paj-vim@johnsy.com>
"         URL: http://github.com/johnsyweb/dotfiles/blob/master/.vimrc

"""" I'm having some terminal problems under Solaris.
"""" These mappings help:
map <Esc>[1~   <Home>
map <Esc>[2~   <Insert>
map <Esc>[3~   <Delete>
map <Esc>[4~   <End>
map <Esc>[5~   <PageUp>
map <Esc>[6~   <PageDown>
map <Esc>[A    <Up>
map <Esc>[B    <Down>
map <Esc>[C    <Right>
map <Esc>[D    <Left>
map <Esc>[11~  <F1>
map <Esc>[12~  <F2>
map <Esc>[13~  <F3>
map <Esc>[14~  <F4>
map <Esc>[15~  <F5>
map <Esc>[17~  <F6>
map <Esc>[18~  <F7>
map <Esc>[19~  <F8>
map <Esc>[20~  <F9>
map <Esc>[21~  <F10>
"" F11 and F12 are the same as S-F1 and S-F2, respectively
map <Esc>[23~  <S-F1>
map <Esc>[24~  <S-F2>
map <Esc>[25~  <S-F3>
map <Esc>[26~  <S-F4>
map <Esc>[28~  <S-F5>
map <Esc>[29~  <S-F6>
map <Esc>[31~  <S-F7>
map <Esc>[32~  <S-F8>
map <Esc>[33~  <S-F9>
map <Esc>[34~  <S-F10>
"""" And sometimes on my Mac, too...
if has('multi_byte')
    try
        imap       <BS>
        cmap       <BS>
    endtry
endif

"""" Handy keys on the command-line from, ahem, some other system...
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

set   autoindent
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set   browsedir=buffer
set   cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(s,)20,*30,g0,is,Ws,U4
set   cinwords=
set   clipboard=exclude:.*
set   cmdheight=2
set nocp
set   dictionary=/usr/share/dict/words
set   diffopt+=iwhite
set   display=uhex
set   equalalways
set   expandtab
if executable('ack')
    set grepprg=ack
endif
set   helpheight=15
set   history=10000
set   hls
set   ignorecase
set   incsearch
set nojoinspaces
set   laststatus=2
set   matchpairs=(:),{:},[:],<:>
set   matchtime=2
set   mousehide
set   mousemodel=popup_setpos
if has('multi_byte')
    try
        set showbreak=↪
    catch
    endtry
endif
set   showcmd
if has('spell')
    set spell
    set spelllang=en_au
endif
set nostartofline
set nottyfast
set   nrformats-=octal  " Don't bother with octal, I never use it
set   report=0
set   scrolloff=4
set   shiftround
set   shiftwidth=4
set   shortmess=filmnxtToO
set   showfulltag
set   showmatch
set   smartindent
set   smarttab
set   statusline=[%n]\ %<%f%h%m\ %{fugitive#statusline()}
set   statusline+=\ %#warningmsg#
set   statusline+=%{SyntasticStatuslineFlag()}
set   statusline+=%*
set   statusline+=\ %r%=%b\ 0x%B\ \ %l,%c%V\ %P
set   tags+=$WKSPACE/tags,$WKSPACE/src/tags
set   titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set   viminfo='8,f1,"8,n${HOME}/.viminfo
set   virtualedit=block
set   visualbell t_vb=
set   wildmenu
set   wildmode=longest:list

filetype plugin indent on

" ToHTML options
let html_use_css=1
let html_no_pre=1
let use_xhtml=1

let g:xml_syntax_folding = 1

if (&t_Co > 1)
    syntax on
    if (&t_Co >= 256)
        let g:solarized_termcolors=256
    endif
endif

if ($OS =~"Windows")
    let g:netrw_scp_cmd="\"c:\\Program Files\\PuTTY\\pscp.exe\" -q"
endif

nnoremap <Leader>/ :<C-U>nohlsearch<CR>
nnoremap <Leader>rls :%s/^\s\+//e<CR>
nnoremap <Leader>rts :%s/\s\+$//e<CR>
nnoremap <Leader>date a<CR>=strftime("%Y%m%d")<CR><Esc>
nnoremap <Leader>time a<CR>=strftime("%H:%M")<CR><Esc>
nnoremap <Leader>stamp a<CR>=strftime("%Y%m%d%H%M%S")<CR><Esc>
nnoremap <Leader>vimrc :e $MYVIMRC<CR>

cabb W w

if has('multi_byte')
    try
        abbreviate (snowman) ☃
        abbreviate -->      →
        abbreviate :-(      ☹
        abbreviate :-)      ☺
        abbreviate <--      ←
        abbreviate <==      ⇐
        abbreviate ==>      ⇒
    catch
    endtry
endif
abbreviate JOhns    Johns
abbreviate adn      and
abbreviate flase    false
abbreviate teh      the
abbreviate whre where

call pathogen#infect()

try
    colorscheme solarized
catch
    colorscheme desert
endtry

syntax match Italic /\<paj\>/
syntax match Smiley /[8:;][-*o][(){}\[\]\/\\|p]/

function! ToggleWhitespace()
    setlocal lcs=tab:>-,trail:-,eol:$ list! list?
    if &list
        match ErrorMsg /\s\+$/
    else
        match none
    endif
endfunction

"   [F1]    :help. Built-in.
nnoremap    <F2> :call ToggleWhitespace()<CR>
"   [F3]    toggles between (header, ) source and test files.
nnoremap    <F3> :<C-U>TUT<CR>
"   [F4]    Go to next quick-fix
"[Shift-F4] Go to previous quick-fix
noremap    <F4>   :<C-U>cnext <CR>
noremap    <S-F4> :<C-U>cprevious <CR>
"   [F5]    make
"[Shift-F5] make (but wait for arguments)
nnoremap    <F5>   :<C-U>make<CR>
nnoremap    <S-F5> :<C-U>make<space>
"   [F6]    Break a line and right-align it
nnoremap    <F6> <Esc>i<CR><Esc>:ri <CR>
"   [F7]    Toggle Vim v7.0 Spell-Checking
if v:version >= 700
    nnoremap <F7> :<C-U>set spell! spell?<CR>
endif
nnoremap <silent> <F8> :TlistToggle<CR>

" Comments are lies (exception that proves the rule).
nnoremap <Leader>ic :<C-U>highlight! link Comment Ignore<CR>
nnoremap <Leader>sc :<C-U>highlight! Comment ctermfg=14 guifg=#80a0ff<CR>

"    \1      git: show first commit where term under cursor was added:
nnoremap <Leader>1 :!git log --reverse -p -S<cword> %<CR>

let g:syntastic_check_on_open=0
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='>'
if has('multi_byte')
    try
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
    catch
    endtry
endif

let g:snips_author = 'Pete Johns'

inoremap jk <Esc> :write<CR>
nnoremap jk :write<CR>
