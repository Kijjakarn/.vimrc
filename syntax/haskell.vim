if exists("b:current_syntax")
    finish
endif

syn keyword haskellKeyword    if then else case let in deriving do otherwise of
syn keyword haskellSpecial    where
syn keyword haskellIdentifier _
syn keyword haskellBegin      data newtype type import module main qualified as

syn match haskellType        "\<\u\w*\>"

syn match haskellOperator    "[:;,.=]"
syn match haskellOperator    "[+*/%><\\-]"
syn match haskellOperator    "&\||\|`\|\$\|@"
syn match haskellBrace       "[][)(}{]"

syn match haskellFloat       "\<\d\+\(\.\d*\)\?\([eE][+-]\?\d\+\>\)\?"
syn match haskellHex         "0x\x*"
syn match haskellSpecialChar "\\." contained

syn region haskellString contains=haskellSpecialChar start=/"/ skip=/\\./ end=/"/ oneline
syn region haskellInfix                              start=/`/            end=/`/ oneline

syn match haskellChar contains=haskellSpecialChar "'\(\\.\|.\|\\x\x*\)'"

syn match  haskellComment    "\v--.*$"
syn region haskellBlockComment start="{-" end="-}"

hi link haskellKeyword      Keyword
hi link haskellType         Type
hi link haskellOperator     Operator
hi link haskellInfix        Operator
hi link haskellIdentifier   Identifier
hi link haskellBrace        Brace
hi link haskellNumber       Number
hi link haskellFloat        Number
hi link haskellHex          Number
hi link haskellString       String
hi link haskellChar         String
hi link haskellSpecial      Special
hi link haskellBegin        Include
hi link haskellSpecialChar  SpecialChar
hi link haskellComment      Comment
hi link haskellBlockComment Comment

let b:current_syntax = "haskell"
