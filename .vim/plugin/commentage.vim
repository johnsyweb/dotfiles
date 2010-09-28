function! ProcessCommentage()

"Read in commentage
-r Mail/pajLogCommentage

" Remove headers...
1,$substitute/^From apache\_.\{-}\_^$/<!-- Commentage -->/e

"Convert quotes, angle-brackets and apersands...
1,$substitute/&/\&amp;/eg
1,$substitute/"/\&quot;/eg
1,$substitute/<\([^!]\)/\&lt;\1/eg
1,$substitute/\([^-]\)>/\1\&gt;/eg

" Remove Referral lines...
1,$substitute/^Referrer: http:\/\/.\{-}\(\/.*\)/<p>\tReferring to <a href="\1">this entry<\/a><\/p>/e

"remove Submit lines...
1,$substitute/^submit:.*//e
1,$substitute/^From:.*//e
1,$substitute/^Subject:.*/<!-- & -->/e

"Convert URLS...
1,$substitute/\([a-z]\+:\/\/[^<> ]\+\)/<a href="\1">\1<\/a>/eg

"Blockquote commentage...
1,$substitute/^Comment\(age\|s\): \(\_.\{-}\)[\r\n\t]\+\(\%$\|\_^<!-- Commentage -->\)/<blockquote>\t<p>\t\t\2\t<\/p><\/blockquote><p>\t<\/p>/e
1,$substitute/^\([^< \t].\+\)\(\n\)*/\t<\/p>\t<p>\t\t\1/e

"Wrap any long lines...
g/^.\{81,}/normal! gqq

"Clear highlighting
noh

"Go to top
normal! gg

"Write
w

endfunction

map ,pc call ProcessCommentage()
