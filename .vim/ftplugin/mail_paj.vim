setlocal textwidth=65

nnoremap <Leader>e :%s/\(\[\|<\)\(mailto:\|SMTP:\)*[A-Za-z0-9_\-\.]*@[A-Za-z0-9_\-\.]*\(\]\|>\)//ge<CR>
nnoremap <Leader>E :%s/\([A-Za-z0-9_\.]*@[A-Za-z0-9_\-\.]\)[A-Za-z0-9_\-\.]*/\1.../ge<CR>
nnoremap <Leader>q :%s/^[> ^I]*//<CR>

" Remove signature
nnoremap <Leader>S :%s/^>*-- \(\n.*\)\{\}//e<CR>
" ',s' postpend my official signature to the document.
nnoremap <Leader>s mq:$<CR>o<CR>--paj<CR>-- <Esc>:r!sigline.py<CR>`q
" Remove all leading spaces from lines.
nnoremap <Leader>rls :%le<CR>
" Remove all trailing spaces from lines.
nnoremap <Leader>rts :%s/\s\+$//e<CR>
" Replace '> ' with '>' -- that's my quoting style.
nnoremap <Leader>>>  :%s/>\s\+/>/e<CR>
" Use Vim to reformat the paragraphs.
nnoremap <Leader>par  mqgggqG`q<CR>
" Increas quote Level
nnoremap <Leader>ad> :%s/^/>/e<CR>
" Remove multiple lines consisting solely of '>'s.
nnoremap <Leader>c>  :%s/\(^>\s*\n\)\{2,\}//ge<CR>
" Remove all lines consisting solely of multiple '>'s.
nnoremap <Leader>rm>  :%s/^>\{2,\}\s*\n//ge<CR>
" Remove all lines beginning with 4 or more '>'s.
nnoremap <Leader>r4> :%s/^>\{4,\}.*\n//ge<CR>
" Add a blank line at the end of quoted paragraphs.
nnoremap <Leader>abl :%s/^>\s*$/>\r/ge<CR>
" All of the above and move to end of first block
nmap <Leader>==  <Leader>rls<Leader>rts<Leader>>><Leader>par<Leader>ad><Leader>c><Leader>rm><Leader>r4><Leader>ablgg0}:noh<CR>
" Same as the previous one, apart from no prepending of '>' [e].
nmap <Leader>**  <Leader>rls<Leader>rts<Leader>>><Leader>par<Leader>c><Leader>rm><Leader>r4><Leader>ablgg0}:noh<CR>
" Remove email addresses, remove signatures, format email, add my sig.
imap <Leader>fm <Esc><Leader>E<Leader>S<Leader>**<Leader>s i
nmap <Leader>fm <Leader>E<Leader>S<Leader>**<Leader>s

syntax match Smiley /[8:;][-*o][(){}\[\]\/\\|p]/
syntax match Italic /\<paj\>/

