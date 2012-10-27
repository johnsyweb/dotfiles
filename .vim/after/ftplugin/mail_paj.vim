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
silent normal maG
silent normal o-- 
silent r!sigline.py
silent normal 'a

nohls

