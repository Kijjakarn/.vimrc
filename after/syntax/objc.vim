if exists("b:current_syntax")
    syntax clear
endif

runtime! syntax/c.vim
runtime! syntax/objc_no_c.vim
unlet b:current_syntax

let b:current_syntax = "objc"
