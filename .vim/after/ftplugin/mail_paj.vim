""""    I like to keep my mails at 65 chars wide.
setlocal textwidth=65 formatoptions=tcrq

if getline(1) =~ "^On "
    """"    Remove all trailing spaces from lines.
    silent %s/\s\+$//e

    """"     Replace '> ' with '>' -- that's my indent style.
    silent %s/\([|>]\)\s\=/\1/ge

    """"    Five levels of quotations are too many, get rid...
    silent g/^\([|>]\)\{5,}/d

    """"    Clear any lines with just quotations...
    silent g/^\([|>]\s*\)\{2,}$/d
    "   Put a blank betwixt a blank, singly quoted line and one of higher
    "   quotation.
    silent %s/^\(>\)\_s\(\1\{2,}\)/\2/ge
    silent %s/^\(>\)\_s\(\1\{1,}\)/\1\2/ge


    """"    Remove Blank Lines before singly-quoted blocks...
    "silent %s/^\_s\{-}\([|>][^|>]\)/\1/e

    """"    Remove email addresses...
    "   Outlook ones can go entirely...
    silent %s/\[mailto\f\+@\f\+\]//ge
    "   Leave some record of other addresses, but strip off the domain
    "   to prevent malware harvesting/..
    silent %s/<\=\(\f\+@\f\)\f\+>\=/<\1...>/ge

    """"    Remove signatures...
    "silent %s/^\([|>]\)*--\_s\_.*//e
    silent g/-- $/normal d}

    """"    Any paragraphs with lines greater than 65 chars should be
    """"    reformatted, leaving the attribution alone.
    silent 2,$g/.\{66,}/normal v}gq

endif

""""    Go to the beginning of the story...
normal gg}

""""    Append signature...
"   Mark where we are (a) and go to end of file
silent normal maG
"   Signatures start dash, dash, space
silent normal o-- 
"   read in ${HOME}./signature.sh
silent r!${HOME}/.signature.sh
"   Return whence thou camest
silent normal 'a

nohls

