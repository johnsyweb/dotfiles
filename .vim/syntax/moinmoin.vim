" Vim syntax file
" Language:	MoinMoin Wiki
" Maintainer:	Robert Kieffer <robert@broofa.com>
" URL:		http://www.broofa.com/Tools/vim/syntax/moinmoin.vim
" Last Change:  2007 Jan 25

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

syn match  wikiError		"''\+"
syn match  wikiError		"^\(\s\s\)*\s"
syn match  wikiH1		"^= .* =$"
syn match  wikiH2		"^== .* ==$"
syn match  wikiH3		"^=== .* ===$"
syn match  wikiH4		"^==== .* ====$"
syn match  wikiH5		"^===== .* =====$"
syn match  wikiI		"''.*''"
syn match  wikiB		"'''.*'''"
syn match  wikiBI		"'''''.*'''''"
syn match  wikiLI		"^\(\s\s\)\+\* "
syn match  wikiLI		"^\(\s\s\)\+[0-9]\+\. "
syn match  wikiLI		"^\s\+::"
syn match  wikiUnderline		"^__.*__"
syn match  wikiA		"\[http[s]\?:.*\]"
syn match  wikiA		"\[wiki:.*\]"
"see '\@<!' in vimdoc.org
syn match  wikiA		"\(!\)\@<!\<[A-Z]\+[a-z]\+[A-Z][a-zA-Z]*\>"
syn match  wikiWord     /\(\w\+:\)\?\u[a-z0-9]\+\(\u[a-z0-9]\+\)\+/


hi wikiA            gui=underline   guifg=Blue
hi wikiB            gui=bold
hi wikiBI           gui=italic,bold
hi wikiBLOCKQUOTE                   guifg=Cyan
hi wikiError        gui=standout
hi wikiH1           gui=bold        guifg=DarkRed       guibg=bg
hi wikiH2           gui=bold        guifg=DarkYellow    guibg=bg
hi wikiH3           gui=bold        guifg=DarkGreen     guibg=bg
hi wikiH4           gui=bold        guifg=Blue          guibg=bg
hi wikiH5           gui=bold        guifg=Magenta       guibg=bg
hi wikiI            gui=italic
hi wikiLI           gui=bold        guifg=Blue
hi wikiUnderline    gui=underline
hi wikiWord         gui=bold        guifg=Green
