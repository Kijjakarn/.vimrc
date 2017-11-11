if exists("b:current_syntax")
    finish
endif

syn keyword swiftKeyword            defer
syn keyword swiftImport             import
syn keyword swiftKeyword            get set didSet willSet as is operator
syn keyword swiftFunction           deinit
syn keyword swiftControlTransfer    continue break fallthrough return throw
syn keyword swiftException          try catch do throws
syn keyword swiftAccess             public private internal
syn keyword swiftPrefix             override mutating indirect static lazy final
syn keyword swiftPrefix             convenience required infix prefix postfix
syn keyword swiftPrefix             weak unowned dynamic inout
syn keyword swiftIdentifier         newValue oldValue rawValue error
syn keyword swiftIdentifier         self super
syn keyword swiftIdentifier         _
syn keyword swiftSpecial            var let func precedencegroup
syn keyword swiftSpecial            typealias associatedtype
syn keyword swiftLabel              in case default where
syn keyword swiftConditional        if else guard switch
syn keyword swiftRepeat             for while repeat
syn keyword swiftBoolean            true false
syn keyword swiftConstant           nil
syn keyword swiftStructure          class struct enum protocol extension

syn match swiftSpecial              "@\w*\>\((\w*)\)\?"
syn match swiftOperator             "[:;,.=$#]"
syn match swiftOperator             "=="
syn match swiftOperator             "==="
syn match swiftOperator             "[+*/%-]"
syn match swiftOperator             "[&|^~]"
syn match swiftOperator             "?"
syn match swiftOperator             "!"
syn match swiftOperator             "\W[<>]"
syn match swiftOperator             "[<>]\W"
syn match swiftBrace                "[][}{><]"
syn match swiftParenthesis          "[()]"
syn match swiftSpecialChar          "\\." contained

syn region swiftStringLiteral oneline start=/'/ skip=/''/ end=/'/
syn region swiftString        oneline start=/"/ skip=/\\./ end=/"/
    \ contains=swiftStringExpand,swiftSpecialChar
syn region swiftStringExpand  oneline matchgroup=Operator start="\\(" end=")"
    \ contains=ALLBUT,swiftAngleBracket contained containedin=swiftString

syn match  swiftComment      "\v//.*$"
syn region swiftBlockComment start="\/\*" end="\*\/"

" No blank line in function body
syn match swiftGenericFunction "\w\+\(\n\?\s*\)\?<\w\_.\{-}>\n\?\s*\ze("
    \ contains=ALLBUT,swiftParenthesis
syn match swiftFunction        "\w\+\s*[?!]\?\n\?\s*\ze(" contains=swiftOperator

syn region swiftParentheses matchgroup=swiftParenthesis
    \ contains=ALLBUT,swiftParenthesis,swiftAngleBracket
    \ start="(" end=")"

syn match swiftType                 "\<\u\w*\>"
syn match swiftConstant             "\<\(_\|\u\|\d\)\{2,}\>"

syn match swiftFloat  "\<\d\(\d\|_\)*\(\.\(\d\|_\)\+\)\?\(e[+-]\?\(\d\|_\)\+\>\)\?"
syn match swiftFloat  "\<0x\(\x\|_\)\+\(\.\(\x\|_\)\+\)\?\(p[+-]\?\(\x\|_\)\+\>\)\?"
syn match swiftNumber "\<0o\(\o\|_\)\+\>"
syn match swiftNumber "\<0b[_01]\+\>"

hi link swiftTest                    Number
hi link swiftKeyword                 Keyword
hi link swiftImport                  Include
hi link swiftControlTransfer         Keyword
hi link swiftLabel                   Label
hi link swiftType                    Type
hi link swiftSpecial                 Special
hi link swiftConditional             Conditional
hi link swiftRepeat                  Repeat
hi link swiftFunction                Function
hi link swiftGenericFunction         Function
hi link swiftComment                 Comment
hi link swiftBlockComment            Comment
hi link swiftOperator                Operator
hi link swiftNumber                  Number
hi link swiftFloat                   Float
hi link swiftString                  String
hi link swiftStringLiteral           String
hi link swiftConstant                Constant
hi link swiftStructure               Structure
hi link swiftIdentifier              Identifier
hi link swiftAccess                  StorageClass
hi link swiftPrefix                  StorageClass
hi link swiftSpecialChar             SpecialChar
hi link swiftException               Exception
hi link swiftBoolean                 Boolean
hi link swiftAngleBracket            Brace
hi link swiftParenthesis             Brace
hi link swiftBrace                   Brace

let b:current_syntax = "swift"
