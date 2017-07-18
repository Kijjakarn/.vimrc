if exists("b:current_syntax")
    syn clear
endif

syn keyword javaControlTransfer    goto break return continue
syn keyword javaLabel              case default
syn keyword javaConditional        if else switch
syn keyword javaRepeat             while for do
syn keyword javaOperator           sizeof instanceof extends implements
syn keyword javaTodo contained     TODO FIXME XXX
syn keyword javaIdentifier         this
syn keyword javaKeyword            new delete friend using
syn keyword javaKeyword            inline virtual explicit export
syn keyword javaException          throws throw try catch
syn keyword javaBoolean            true false
syn keyword javaInclude            import package
syn keyword javaConstant           null

syn keyword javaType        int long float double short char void byte boolean
syn keyword javaPrefix      static final private public protected abstract

syn match javaOperator          "[:;,.!=$#]"
syn match javaOperator          "[+*/%-]"
syn match javaOperator          "[&|^~]"
syn match javaOperator          "?"
syn match javaOperator          "[<>]"
syn match javaBrace             "[][{}]"
syn match javaParenthesis       "[()]"
syn match javaSpecialChar       "\\." contained

syn match javaSpecial           "@\w\+"

syn region javaString contains=javaSpecialChar start=/"/ skip=/\\./ end=/"/ oneline
syn region javaChar   contains=javaSpecialChar start=/'/ skip=/''/  end=/'/ oneline

syn match  javaComment          "\v//.*$"           contains=javaTodo
syn region javaBlockComment start="\/\*" end="\*\/" contains=javaTodo

syn match  javaFunction         "\w\+\s*\n\?\s*\ze("
syn region javaParentheses matchgroup=javaParenthesis contains=ALLBUT,javaParenthesis
    \ start="(" end=")"

syn match javaGenerics          "<\S.*\S>" contains=ALL
syn match javaGenerics          "<\h>"     contains=ALL
syn match javaAngleBracket      "[<>]"     contained containedin=javaGenerics

syn region javaParentheses matchgroup=javaParenthesis
    \ contains=ALLBUT,javaParenthesis,javaAngleBracket
    \ start="(" end=")"

syn match javaStructure   "\<\(class\|enum\|interface\)\>"
syn match javaDeclaration "\<\(class\|enum\|interface\)\>\s\+\w*"
    \ contains=javaStructure

syn match javaType              "\<\u\w*\>"
syn match javaType              "\<\w*_t\>"
syn match javaConstant          "\<\(_\|\u\|\d\)\{2,}\>"

syn match javaFloat             "\<\d\+\(\.\d\+\)\?\(e[+-]\?\d\+\>\)\?"
syn match javaNumber            "\<0x\x\+\(\.\x\+\)\?\(p[+-]\?\x\+\>\)\?"

hi link javaInclude                Include
hi link javaPrefix                 StorageClass
hi link javaKeyword                Keyword
hi link javaControlTransfer        Keyword
hi link javaLabel                  Label
hi link javaConditional            Conditional
hi link javaRepeat                 Repeat
hi link javaFunction               Function
hi link javaComment                Comment
hi link javaBlockComment           Comment
hi link javaIdentifier             Identifier
hi link javaOperator               Operator
hi link javaNumber                 Number
hi link javaFloat                  Float
hi link javaString                 String
hi link javaChar                   String
hi link javaConstant               Constant
hi link javaStructure              Structure
hi link javaDeclaration            Function
hi link javaSpecialChar            SpecialChar
hi link javaParenthesis            Brace
hi link javaAngleBracket           Brace
hi link javaBrace                  Brace
hi link javaBoolean                Boolean
hi link javaTodo                   Todo
hi link javaType                   Type
hi link javaSpecial                Special
hi link javaException              Exception

let b:current_syntax = "java"
