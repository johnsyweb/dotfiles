"        File: .vim/colors/primitive.vim [Vim colour file]
" Description: Local colour file - set colours 
"  Maintainer: Pete Johns <paj-vim@johnsy.com>
"         URL: http://johnsy.com/dotfiles/.vim/colors/primitive.vim 
"     Version: 1.1
" Last Change: 2006-03-21

" A primitive colour scheme, designed to look as good (or as bad) on an
" 8-colour terminal as it does in the GUI.

" To tweak this file for your own deviance, please see:
" :help cterm-colors
" :help group-name
" :help highlight
" :help highlight-groups

set background=light
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    highlight clear
    if exists("syntax_on")
      syntax reset
    endif
endif
let g:colors_name="primitive"

highlight Bold                              term=Bold                               gui=Bold
highlight Boolean       ctermfg=DarkBlue                        guifg=DarkBlue
highlight Character     ctermfg=DarkCyan                        guifg=DarkCyan
highlight Comment       ctermfg=DarkGrey                        guifg=DarkGrey      gui=Bold
highlight Constant      ctermfg=DarkBlue                        guifg=DarkBlue
highlight Cursor        ctermfg=LightRed    ctermbg=DarkBlue    guifg=LightRed      guibg=DarkBlue
highlight DiffAdd                           ctermbg=DarkGreen                       guibg=LightGreen   term=None
highlight DiffChange                        ctermbg=DarkYellow                      guibg=LightYellow
highlight DiffDelete                        ctermbg=DarkRed                         guibg=LightRed
highlight DiffText      ctermfg=LightRed    ctermbg=DarkBlue    guifg=Yellow        guibg=LightBlue
highlight Directory     ctermfg=DarkCyan                        guifg=DarkCyan
highlight Error         ctermfg=White       ctermbg=Red         guifg=White         guibg=Red           term=Bold  gui=Bold
highlight FoldColumn    ctermfg=DarkGreen   ctermbg=White       guifg=DarkGreen     guibg=White         term=standout
highlight Folded        ctermfg=DarkGreen   ctermbg=White       guifg=DarkGreen     guibg=White         term=standout
highlight Function      ctermfg=Green                           guifg=DarkGreen
highlight Identifier    ctermfg=Green                           guifg=DarkGreen
highlight Ignore        ctermfg=Grey                            guifg=DarkGrey
highlight IncSearch                         term=Bold,Reverse                       gui=Bold,Reverse
highlight Italic                            term=Italic                             gui=Italic
highlight LineNr        ctermfg=Grey        ctermbg=NONE        guifg=DarkGrey      guibg=LightGrey
highlight ModeMsg       ctermfg=Cyan                            guifg=LightCyan
highlight MoreMsg       ctermfg=DarkGreen                       guifg=DarkGreen
highlight NonText       ctermfg=DarkBlue    term=Bold           guifg=DarkBlue      gui=Bold
highlight Normal        ctermfg=DarkBlue                        guifg=DarkBlue
highlight Number        ctermfg=DarkBlue                        guifg=DarkBlue
highlight Operator                          term=Bold                               gui=Bold
highlight PreProc       ctermfg=Green                           guifg=DarkGreen
highlight Question      ctermfg=DarkGreen                       guifg=DarkGreen
highlight Search        ctermfg=DarkCyan    ctermbg=DarkBlue    guifg=DarkCyan      guibg=DarkBlue
highlight Smiley        ctermfg=LightRed    term=Bold           guifg=LightRed      gui=Bold
highlight Special       ctermfg=DarkMagenta                     guifg=DarkMagenta
highlight SpecialKey    ctermfg=DarkGreen                       guifg=DarkGreen
if (v:version >= 700)
    highlight PMenu         ctermfg=DarkBlue    ctermbg=Cyan        guifg=DarkBlue      guibg=Cyan
    highlight SpellCap      ctermfg=Green   ctermbg=None term=Bold  guisp=Green         gui=undercurl 
    highlight SpellLocal    ctermfg=Cyan    ctermbg=None term=Bold  guisp=Cyan          gui=undercurl
    highlight SpellRare     ctermfg=Magenta ctermbg=None term=Bold  guisp=Magenta       gui=undercurl
    highlight SpellBad      ctermfg=Red     ctermbg=None term=Bold  guisp=Red           gui=undercurl
endif " version 7+
highlight Statement     ctermfg=Black       term=bold           guifg=Black         gui=Bold
highlight StatusLine    ctermfg=DarkBlue    ctermbg=Cyan        guifg=DarkBlue      guibg=Cyan
highlight StatusLineNC  ctermfg=DarkBlue    ctermbg=White       guifg=DarkBlue      guibg=White     
highlight String        ctermfg=DarkMagenta                     guifg=DarkMagenta
highlight Title         ctermfg=DarkMagenta                     guifg=DarkMagenta
highlight Todo          ctermfg=DarkRed     ctermbg=DarkYellow  guifg=DarkRed       guibg=DarkYellow
highlight Type          ctermfg=DarkBlue    term=Bold           guifg=DarkBlue      gui=Bold
highlight Underlined                        term=Underline                          gui=Underline
highlight VertSplit     ctermfg=Grey        ctermbg=White       guifg=DarkGrey      guibg=White
highlight Visual                            term=Reverse                            gui=Reverse
highlight VisualNOS                         term=Bold,Underline                     gui=Bold,Underline
highlight WarningMsg    ctermfg=White       ctermbg=Red         guifg=White         guibg=Red
highlight WildMenu      ctermfg=DarkGreen   ctermbg=Black       guifg=DarkGreen     guibg=Black

" Mail colouring is slightly different {{{
highlight mailQuoted1   ctermfg=DarkRed                         guifg=Red
highlight mailQuoted2   ctermfg=DarkCyan                        guifg=Cyan
highlight mailQuoted5   ctermfg=DarkMagenta                     guifg=Magenta
highlight link mailEmail     Identifier
highlight link mailURL       Underlined
highlight link mailSubject   SpecialKey
highlight link mailSignature Type


" }}}
