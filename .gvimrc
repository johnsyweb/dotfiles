set columns=80
set guicursor=a:blinkon0
set guioptions=bgmprT
set lines=50
syntax on
if exists(":winpos") == 2
    winpos 0 0
endif

amenu &PAJ.Edit\ _&vimrc              :edit $MYVIMRC<CR>
amenu &PAJ.Convert\ &TABs\ to\ spaces :%s/<TAB>/    /g<CR>
amenu &PAJ.Set\ DOS\ text\ format     :set fileformat=dos<CR>
amenu &PAJ.Set\ UNIX\ text\ format    :set fileformat=unix<CR>
amenu &PAJ.Strip\ quotes              :%s/> *//g<CR>
amenu &PAJ.Strip\ trailing\ spaces    :%s/[ <TAB>]\+$//g<CR>
amenu &PAJ.Strip\ leading\ spaces     :%s/^\ \+//g<CR>
amenu &PAJ.Shrink\ white\ space       :%s/\ \+/ /g<CR>

