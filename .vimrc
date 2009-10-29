"        File: .vimrc [Vim resource script]
" Description: Settings, commands and mappings for Vim
"  Maintainer: Pete Johns <paj-vim@johnsy.com>
"         URL: http://github.com/johnsyweb/dotfiles/blob/master/.vimrc

"""" I'm having some terminal problems under Solaris. 
"""" These mappings help:
map <ESC>[1~   <Home>
map <ESC>[2~   <Insert>
map <ESC>[3~   <Delete>
map <ESC>[4~   <End>
map <ESC>[5~   <PageUp>
map <ESC>[6~   <PageDown>
map <ESC>[A    <Up>
map <ESC>[B    <Down>
map <ESC>[C    <Right>
map <ESC>[D    <Left>
map <ESC>[11~  <F1>
map <ESC>[12~  <F2>
map <ESC>[13~  <F3>
map <ESC>[14~  <F4>
map <ESC>[15~  <F5>
map <ESC>[17~  <F6>
map <ESC>[18~  <F7>
map <ESC>[19~  <F8>
map <ESC>[20~  <F9>
map <ESC>[21~  <F10>
"" F11 and F12 are the same as S-F1 and S-F2, respectively
map <ESC>[23~  <S-F1>
map <ESC>[24~  <S-F2>
map <ESC>[25~  <S-F3>
map <ESC>[26~  <S-F4>
map <ESC>[28~  <S-F5>
map <ESC>[29~  <S-F6>
map <ESC>[31~  <S-F7>
map <ESC>[32~  <S-F8>
map <ESC>[33~  <S-F9>
map <ESC>[34~  <S-F10>
"""" And sometimes on my Mac, too...
imap       <BS>
cmap       <BS>

"""" GLOBAL OPTIONS {{{
set   autoindent
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set   browsedir=buffer
set   cmdheight=2
set nocindent
set   cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(0,)20,*30,g0,is
set   cinwords=
set nocp
set   dictionary=/usr/share/dict/words
set   diffopt+=iwhite
set noerrorbells
set   equalalways
set   expandtab
set   helpheight=15
set   history=64
set   hls
set   ignorecase
set   incsearch
set noinfercase
set noinsertmode
set nojoinspaces
set   laststatus=2
set   makeprg=make
set   matchpairs=(:),{:},[:],<:>
set   matchtime=2
set   mousefocus
set   mousehide
set   mousemodel=popup_setpos                                                     
set   showcmd
set   smd
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
set   showmode
set   smartindent
set   smarttab
set   statusline=[%n]\ %<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set   tabstop=4
set   tags+=$WKSPACE/tags,$WKSPACE/src/tags
set   textwidth=0
set   titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set   vb t_vb=
set   viminfo='8,f1,"8,n${HOME}/.viminfo
set   virtualedit=block
set   visualbell
set   wildmenu
set   wildmode=longest,list
set nowrap
""" }}}

"""" Turn on file type stuff to let Vim work its magic {{{
filetype plugin indent on
"""" }}}

"""" ToHTML options... {{{
let html_use_css=1
let html_no_pre=1
let use_xhtml=1
"""" }}}

"""" *xml-folding* {{{
let g:xml_syntax_folding = 1
"""" }}}

"""" PHP Syntax {{{
"XXX Move to .vim/ftplugin/php.vim
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_folding = 0
""""}}}

"""" If we're in a colour terminal (or this is the GUI version), turn on syntax. {{{
if (&t_Co > 1 ) || has("gui_running")
    syntax on
endif
""""}}}

"""" You could put this in .gvimrc, but I like having just the one file to move {{{
"""" from server to server.
if has("gui_running")
    "set guifont=Lucida_Console:h8:cDEFAULT
    set guifont=Monospace\ 9
    set guicursor=a:blinkon0
    set guioptions=bgmprT

    if exists(":winpos") == 2
        winpos 0 0
    endif
    set lines=50 columns=80
endif
""""}}}

"""" 20060318 using PSCP on Windows. N.B: Works best with Pageant. {{{
if ($OS =~"Windows")
    let g:netrw_scp_cmd="\"c:\\Program Files\\PuTTY\\pscp.exe\" -q"
endif
""""}}}

"""" GUI OPTIONS -- MENUS {{{
amenu &PAJ.Edit\ _&vimrc              :edit $HOME/.vimrc<CR>
amenu &PAJ.Convert\ &TABs\ to\ spaces :%s/<TAB>/    /g<CR>
amenu &PAJ.Set\ DOS\ text\ format     :set fileformat=dos<CR>
amenu &PAJ.Set\ UNIX\ text\ format    :set fileformat=unix<CR>
amenu &PAJ.Strip\ \quotes\            :%s/> *//g<CR>
amenu &PAJ.Strip\ trailing\ spaces    :%s/[ <TAB>]\+$//g<CR>
amenu &PAJ.Strip\ leading\ spaces     :%s/^\ \+//g<CR>
amenu &PAJ.Shrink\ white\ space       :%s/\ \+/ /g<CR>
nmap	<Leader>vimrc :edit $HOME/.vimrc<CR>
""""}}}


"""" AUTOCMDS -- TESTING {{{
set   verbose=0
""""}}}

"""" AUTOCMDS -- GLOBAL {{{
""autocmd VimEnter * set vb t_vb=
""""}}}

"""" AUTOCMDS -- MAIL    {{{
augroup Mail
    autocmd FileType mail   set textwidth=65
    autocmd FileType mail   set formatoptions=tcrq
augroup END
""""}}}

"""" AUTOCMDS -- Web {{{
autocmd BufEnter,BufRead *w3m*  set filetype=html
autocmd FileType html set textwidth=80
autocmd FileType html set formatoptions=tcrq
" This is the magic for making a backup of what I enter into a <textarea>...
autocmd BufWrite,BufLeave *w3m*  execute "write! ".expand("<afile>").".backup"
""""}}}


"""" AUTOCMDS -- SOURCE CODE -- JAVA {{{
autocmd BufEnter,BufRead *.java  set makeprg=javac\ %
autocmd BufEnter,BufRead *.java  set errorformat=\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m
""""}}}

"""" AUTOCMDS -- CONFIGURATION FILES {{{
autocmd BufEnter,BufRead *.cf,*.rules,*.tmpl  set tabstop=8
""""}}}

"""" KEY MAPPINGS -- GENERAL {{{
noremap -    gqap
vmap    -    gq                 
map	<Leader>e :%s/\(\[\|<\)\(mailto:\|SMTP:\)*[A-Za-z0-9_\-\.]*@[A-Za-z0-9_\-\.]*\(\]\|>\)//ge<CR>
map	<Leader>E :%s/\([A-Za-z0-9_\.]*@[A-Za-z0-9_\-\.]\)[A-Za-z0-9_\-\.]*/\1.../ge<CR>
map	<Leader>q :%s/^[> ^I]*//<CR>
nnoremap \date a<C-R>=strftime("%Y%m%d")<CR><Esc>
nnoremap \time a<C-R>=strftime("%H:%M")<CR><Esc>
nnoremap \stamp a<C-R>=strftime("%Y%m%d%H%M%S")<CR><Esc>



""""}}}

"""" KEY MAPPINGS -- INSERT MODE {{{
"reformat block
"imap    <F5> <Esc>=%%a  
""""}}}


"""" KEY MAPPINGS -- COMMAND MODE {{{
" ',c' -- Comment out the current line, appending a '/* paj */' tag
map	<Leader>c :s}^\([    ]*\)\(.*\)$}\1/* \2 */ /* ${LOGNAME} */}<CR>
" ',C' -- Uncomment the current line, removing a '/* paj */' tag
map	<Leader>C :s}/* \(.*\) */ /* ${LOGNAME} */}\1/<CR>
""""}}}

"""" KEY MAPPINGS -- COMMAND LINE {{{
"cmap W w
cabb W w
""""}}}


"""" KEY MAPPINGS -- MAIL + NEWS {{{
" ',S' deletes the signature.
"map	<Leader>S gg/^[> ]*-- $<CR>dG
map	<Leader>S :%s/^>*-- \(\n.*\)\{\}//e<CR>
""""}}}

" ',s' postpend my official signature to the document.
"map	<Leader>s mq:$<CR>o-- <Esc>:r! /home/paj/.signature.sh<CR>`q


" This one's great!
"   (a) Remove all leading spaces from lines.
"   (b) Remove all trailing spaces from lines.
"   (c) Pipe through 'par' to reformat the paragraphs.
"   (d) Replace '> ' with '>' -- that's my indent style.
"   (e) Prepend '>' to every line.
"   (f) Clear all lines consisting solely of '>'s.
"map	<Leader>== {:1,$s/^[ ]*// }{:1,$s/[ ]*$// }{:1,$s/> />/g }{:1,$s/^/>/ }{:1,$s/^[>]*$// }:1

" ',**' -- Same as the previous one, apart from no prepending of '>' [e].
"map	<Leader>** {:1,$s/^[ ]*// }{:1,$s/[ ]*$// }{:1,$s/> />/g }{:1,$s/^[>]*$// }:1

" ',+' -- pass the whole document thru "par"
map	<Leader>+ {:1,$!par w72 }

" ',s' postpend my official signature to the document.
map	<Leader>s mq:$<CR>o<CR>--paj<CR>-- <Esc>:r! ${HOME}/.signature.sh<CR>`q

" This one's great! [Re-written, by paj]
"   (a) Remove all leading spaces from lines.
map	<Leader>rls :%s/^\s\+//e<CR>
"   (b) Remove all trailing spaces from lines.
map	<Leader>rts :%s/\s\+$//e<CR>
"   (c) Replace '> ' with '>' -- that's my indent style.
map	<Leader>>>  :%s/>\s\+/>/e<CR>
"   (d) Use Vim  to reformat the paragraphs.
map	<Leader>par  mqgggqG`q<CR>
"   (e) Prepend '>' to every line.
map	<Leader>ad> :%s/^/>/e<CR>
"   (f) Remove multiple lines consisting solely of '>'s.
map	<Leader>c>  :%s/\(^>\s*\n\)\{2,\}//ge<CR>
"   (g) Remove all lines consisting solely of multiple '>'s.
map	<Leader>rm>  :%s/^>\{2,\}\s*\n//ge<CR>
"   (h) Remove all lines beginning with 4 or more '>'s.
map	<Leader>r4> :%s/^>\{4,\}.*\n//ge<CR>
"   (i) Add a blank line at the end of quoted paragraphs.
map	<Leader>abl :%s/^>\s*$/>\r/ge<CR>
"   All of the above and move to end of first block
map	<Leader>==  ,rls,rts,>>,par,ad>,c>,rm>,r4>,ablgg0}:noh<CR>
"   Same as the previous one, apart from no prepending of '>' [e].
map	<Leader>**  ,rls,rts,>>,par,c>,rm>,r4>,ablgg0}:noh<CR>

" 2005-08-17 paj adds some bonus functionality: Remove email addresses, remove
"                signatures, format email, add my sig.
imap	<Leader>fm <ESC>,E,S,**,s i
nmap	<Leader>fm ,E,S,**,s

"""" EXTENSIONS (heh) {{{
""""}}}

if filereadable(expand("hints"))
    au BufNewFile,BufReadPost *.c,*.C,*.cpp,*.c++,*.CPP,*.cxx
    so hints
endif


" '[c' -- searches back to the previous case statement and echoes it to the status line
nmap [c   :?^\s*case? mark k\|echo getline("'k")<cr>


"""" Abbreviations {{{
abbreviate teh      the
abbreviate flase    false
abbreviate JOhns    Johns
abbreviate adn      and
""""}}}

"""" Colours {{{
colorscheme desert
"TODO: This will go elsewhere:
highlight default mailQuoted1   ctermfg=DarkRed        guifg=Red
highlight default mailQuoted2   ctermfg=DarkCyan       guifg=Cyan
highlight default mailQuoted5   ctermfg=DarkMagenta    guifg=Magenta
highlight default link mailEmail     Identifier
highlight default link mailURL       Underlined
highlight default link mailSubject   SpecialKey
highlight default link mailSignature Type
""""}}}

"This should probably be in a separate file, but I shall leave it here for now:
syntax match Italic /\<paj\>/
syntax match Smiley /[8:;][-*o][(){}\[\]\/\\|p]/

"""" Function Key Mappings {{{
"   [F1]    :help. Built-in.

"   [F2]    shows and hides whitespace.
nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

"   [F3]    toggles between (header, ) source and test files.
nnoremap    <F3> :<C-U>TUT<CR>

"   [F4]    Go to next quick-fix
"[Shift-F4] Go to previous quick-fix
"
noremap    <F4>   :<C-U>cnext <CR>   
noremap    <S-F4> :<C-U>cprevious <CR>

"   [F5]    make
"[Shift-F5] make (but wait for arguments)
"
nnoremap    <F5>   :<C-U>make<CR>
nnoremap    <S-F5> :<C-U>make<space>

"   [F6]    Break a line and right-align it
"
nnoremap    <F6> <Esc>i<CR><Esc>:ri <CR> 

"   [F7]    Toggle Vim v7.0 Spell-Checking {{{
if v:version >= 700
    set spelllang=en_au nospell
    nnoremap <F7> :<C-U>set spell! spell?<CR>
endif
"""" }}}

"   [F8]    Diff with version control plug-in
nnoremap    <F8> :<C-U>VCSVimDiff <CR>
"""" }}}
