" Objective-C syntax, but without the C part
" This is useful for making Objective-C++ syntax because we don't want to
" include C syntax twice

syn keyword objcPrincipalType        id instancetype Class SEL IMP BOOL
syn keyword objcBoolean              YES NO
syn keyword objcConstant             nil Nil
syn keyword objcIdentifier           self super
syn keyword objcLabel                in

syn match objcOperator             "@"
syn match objcKeyword              "@\h\w*\>"
syn match objcImport               "#import"

syn match objcParenthesis          "(\|)"

syn match objcProperty             "@property"
syn match objcPropertyDeclaration  "@property\s*(.*)"
    \ contains=ALL

syn keyword objcStorageClass         __weak __strong __block __bridge_retained
syn keyword objcStorageClass         __bridge _Nonnull _Nullable __unused

hi link objcLabel                     Label
hi link objcPrincipalType             Type
hi link objcBoolean                   Boolean
hi link objcConstant                  Constant
hi link objcKeyword                   Keyword
hi link objcSpecial                   Special
hi link objcIdentifier                Identifier
hi link objcInclude                   Include
hi link objcOperator                  Operator
hi link objcProperty                  Special
hi link objcParenthesis               Brace
hi link objcStorageClass              StorageClass
hi link objcPropertyDeclaration       StorageClass
hi link objcPropertyAttributes        StorageClass
