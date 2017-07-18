if exists("b:current_syntax")
    syn clear
endif

syn keyword pythonBoolean         True False
syn keyword pythonConstant        None
syn keyword pythonOperator        and or not
syn keyword pythonSpecial         class def lambda
syn keyword pythonConditional     if elif else
syn keyword pythonException       try except finally
syn keyword pythonControlTransfer return continue break raise yield pass
syn keyword pythonRepeat          for while
syn keyword pythonLabel           in
syn keyword pythonStorageClass    global nonlocal
syn keyword pythonInclude         import
syn keyword pythonKeyword         is as from with del assert
syn keyword pythonIdentifier      _
syn keyword pythonPrint           print

syn match pythonOperator          "[:;,.!=$]"
syn match pythonOperator          "=="
syn match pythonOperator          "==="
syn match pythonOperator          "[+*/%-]"
syn match pythonOperator          "[&|^~]"
syn match pythonOperator          "[<>]"
syn match pythonBrace             "[][}{)(]"
syn match pythonSpecialChar       "\\." contained
syn match pythonComment           "\v#.*$"
syn match pythonFunction          "\w\+\s*\n\?\s*\ze("
syn match pythonType              "\<\u\w*\>"
syn match pythonConstant          "\<\(_\|\u\|\d\)\{2,}\>"
syn match pythonMagic             "__\w\+__"

syn match pythonFloat             "\<\d\+\(\.\d*\)\?\([eE][+-]\?\d\+\>\)\?[uU]\?[lL]\{0,2\}[uU]\?"
syn match pythonNumber            "\<0x\x\+\(\.\x\?\)\?\(p[+-]\?\x\+\>\)\?[uU]\?[lL]\{0,2\}[uU]\?"

syn region pythonString contains=pythonSpecialChar start=/"/ skip=/\\./ end=/"/ oneline
syn region pythonChar   contains=pythonSpecialChar start=/'/ skip=/''/  end=/'/ oneline

syn region pythonDocstring start='"""' end='"""'

hi link pythonBoolean            Boolean
hi link pythonConstant           Constant
hi link pythonOperator           Operator
hi link pythonSpecial            Special
hi link pythonConditional        Conditional
hi link pythonException          Exception
hi link pythonControlTransfer    Keyword
hi link pythonRepeat             Repeat
hi link pythonLabel              Label
hi link pythonStorageClass       StorageClass
hi link pythonInclude            Include
hi link pythonKeyword            Keyword
hi link pythonIdentifier         Identifier
hi link pythonBrace              Brace
hi link pythonType               Type
hi link pythonFloat              Number
hi link pythonNumber             Number
hi link pythonMagic              Constant
hi link pythonPrint              Function

hi link pythonComment            Comment
hi link pythonFunction           Function
hi link pythonString             String
hi link pythonChar               String
hi link pythonSpecialChar        SpecialChar
hi link pythonDocstring          Comment

let b:current_syntax = "python"
