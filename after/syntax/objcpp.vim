if exists("b:current_syntax")
    syntax clear
endif

runtime! syntax/cpp.vim
runtime! syntax/objc_no_c.vim

let b:current_syntax = "objcpp"
