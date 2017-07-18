if exists("b:current_syntax")
    syn clear
endif

syn keyword tigerKeyword    break do else end for function if in let of
syn keyword tigerKeyword    then to while endif begin end enddo return

syn keyword tigerType       array int float
syn keyword tigerSpecial    var function type

syn match tigerOperator       "[:;,.=$#]"
syn match tigerOperator       "=="
syn match tigerOperator       "[+*/-]"
syn match tigerOperator       "[&|^~]"
syn match tigerOperator       "\W[<>]"
syn match tigerOperator       "[<>]\W"
syn match tigerParenthesis    "[][()]"

syn match tigerFloat  "\<\d\(\d\|_\)*\(\.\(\d\|_\)\+\)\?\(e[+-]\?\(\d\|_\)\+\>\)\?"
syn match tigerFloat  "\<0x\(\x\|_\)\+\(\.\(\x\|_\)\+\)\?\(p[+-]\?\(\x\|_\)\+\>\)\?"
syn match tigerNumber "\<0o\(\o\|_\)\+\>"
syn match tigerNumber "\<0b[_01]\+\>"

syn match tigerFunction       "\w\+\s*[?!]\?\n\?\s*\ze(" contains=tigerOperator
syn region tigerBlockComment start="\/\*" end="\*\/"

hi link tigerKeyword                 Keyword
hi link tigerType                    Type
hi link tigerSpecial                 Special
hi link tigerFunction                Function
hi link tigerBlockComment            Comment
hi link tigerOperator                Operator
hi link tigerNumber                  Number
hi link tigerFloat                   Float
hi link tigerIdentifier              Identifier
hi link tigerParenthesis             Brace

let b:current_syntax = "tiger"
