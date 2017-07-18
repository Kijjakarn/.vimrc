if exists("b:current_syntax")
    syn clear
endif

syn keyword javaScriptControlTransfer    goto break return continue
syn keyword javaScriptLabel              case default
syn keyword javaScriptConditional        if else switch
syn keyword javaScriptRepeat             while for do finally
syn keyword javaScriptOperator           sizeof instanceof extends implements super with
syn keyword javaScriptTodo contained     TODO FIXME XXX
syn keyword javaScriptIdentifier         this
syn keyword javaScriptKeyword            new delete yield debugger typeof
syn keyword javaScriptKeyword            inline virtual explicit export
syn keyword javaScriptException          throws throw try catch
syn keyword javaScriptBoolean            true false
syn keyword javaScriptInclude            import package
syn keyword javaScriptSpecial            var function
syn keyword javaScriptConstant           null

syn keyword javaScriptType        int long float double short char void byte boolean
syn keyword javaScriptPrefix      static final private public protected abstract const volatile

syn match javaScriptOperator          "[:;,.!=$#]"
syn match javaScriptOperator          "[+*/%-]"
syn match javaScriptOperator          "[&|^~]"
syn match javaScriptOperator          "?"
syn match javaScriptOperator          "[<>]"
syn match javaScriptBrace             "[][{}]"
syn match javaScriptParenthesis       "[()]"
syn match javaScriptSpecialChar       "\\." contained

syn match javaScriptSpecial           "@\w\+"

syn region javaScriptString contains=javaScriptSpecialChar start=/"/ skip=/\\./ end=/"/ oneline
syn region javaScriptChar   contains=javaScriptSpecialChar start=/'/ skip=/''/  end=/'/ oneline

syn match  javaScriptComment          "\v//.*$"           contains=javaScriptTodo
syn region javaScriptBlockComment start="\/\*" end="\*\/" contains=javaScriptTodo

syn match  javaScriptFunction         "\w\+\s*\n\?\s*\ze("
syn region javaScriptParentheses matchgroup=javaScriptParenthesis contains=ALLBUT,javaScriptParenthesis
    \ start="(" end=")"

syn region javaScriptParentheses matchgroup=javaParenthesis
    \ contains=ALLBUT,javaScriptParenthesis
    \ start="(" end=")"

syn match javaScriptStructure   "\<\(class\|enum\|interface\)\>"
syn match javaScriptDeclaration "\<\(class\|enum\|interface\)\>\s\+\w*"
    \ contains=javaScriptStructure

syn match javaScriptType              "\<\u\w*\>"
syn match javaScriptType              "\<\w*_t\>"
syn match javaScriptConstant          "\<\(_\|\u\|\d\)\{2,}\>"

syn match javaScriptFloat             "\<\d\+\(\.\d\+\)\?\(e[+-]\?\d\+\>\)\?"
syn match javaScriptNumber            "\<0x\x\+\(\.\x\+\)\?\(p[+-]\?\x\+\>\)\?"

hi link javaScriptInclude                Include
hi link javaScriptPrefix                 StorageClass
hi link javaScriptKeyword                Keyword
hi link javaScriptControlTransfer        Keyword
hi link javaScriptLabel                  Label
hi link javaScriptConditional            Conditional
hi link javaScriptRepeat                 Repeat
hi link javaScriptFunction               Function
hi link javaScriptComment                Comment
hi link javaScriptBlockComment           Comment
hi link javaScriptIdentifier             Identifier
hi link javaScriptOperator               Operator
hi link javaScriptNumber                 Number
hi link javaScriptFloat                  Float
hi link javaScriptString                 String
hi link javaScriptChar                   String
hi link javaScriptConstant               Constant
hi link javaScriptStructure              Structure
hi link javaScriptDeclaration            Function
hi link javaScriptSpecialChar            SpecialChar
hi link javaScriptParenthesis            Brace
hi link javaScriptBrace                  Brace
hi link javaScriptBoolean                Boolean
hi link javaScriptTodo                   Todo
hi link javaScriptType                   Type
hi link javaScriptSpecial                Special
hi link javaScriptException              Exception

let b:current_syntax = "javaScript"
