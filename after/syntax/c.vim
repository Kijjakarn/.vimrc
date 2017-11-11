if exists("b:current_syntax")
    syn clear
endif

syn keyword cControlTransfer    goto break return continue asm
syn keyword cStatement          __asm__
syn keyword cLabel              case default
syn keyword cConditional        if else switch
syn keyword cRepeat             while for do
syn keyword cOperator           sizeof
syn keyword cOperator           typeof __real__ __imag__
syn keyword cTodo contained     TODO FIXME XXX
syn keyword cBoolean            TRUE FALSE
syn keyword cKeyword            typedef
syn keyword cConstant           NULL
syn keyword cStructure          struct union enum

syn keyword cType  int long short char void
syn keyword cType  signed unsigned float double
syn keyword cType  size_t ssize_t off_t wchar_t ptrdiff_t sig_atomic_t fpos_t
syn keyword cType  clock_t time_t va_list jmp_buf FILE DIR div_t ldiv_t
syn keyword cType  mbstate_t wctrans_t wint_t wctype_t
syn keyword cType  bool complex
syn keyword cType  int8_t int16_t int32_t int64_t
syn keyword cType  uint8_t uint16_t uint32_t uint64_t
syn keyword cType  int_least8_t int_least16_t int_least32_t int_least64_t
syn keyword cType  uint_least8_t uint_least16_t uint_least32_t uint_least64_t
syn keyword cType  int_fast8_t int_fast16_t int_fast32_t int_fast64_t
syn keyword cType  uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t
syn keyword cType  intptr_t uintptr_t
syn keyword cType  intmax_t uintmax_t
syn keyword cType  __label__ __complex__ __volatile__

syn keyword cStorageClass    static register auto volatile extern const
syn keyword cStorageClass    inline __attribute__ restrict

syn match cType              "\<\u\w*\>"
syn match cType              "\<\w*_t\>"

syn match cOperator          "[:;,.!=$#]"
syn match cOperator          "[+*/%-]"
syn match cOperator          "[&|^~]"
syn match cOperator          "?"
syn match cOperator          "->"
syn match cOperator          "[<>]"
syn match cBrace             "[][{}]"
syn match cParenthesis       "[()]"
syn match cConstant          "\<\(_\|\u\|\d\)\{2,}\>"
syn match cSpecialChar       "\\." contained
syn match cInclude           "#include"
syn match cPreProc           "#\(error\|pragma\)"
syn match cPreCondit         "#\(if\(n\?def\)\?\|elif\|else\|endif\)"

syn match cFloat             "\<\d\+\(\.\d\+\)\?\([eE][+-]\?\d\+\>\)\?[uU]\?[lL]\{0,2\}[uU]\?"
syn match cNumber            "\<0x\x\+\(\.\x\?\)\?\(p[+-]\?\x\+\>\)\?[uU]\?[lL]\{0,2\}[uU]\?"

syn region cString contains=cSpecialChar start=/"/ skip=/\\./ end=/"/ oneline
syn region cChar   contains=cSpecialChar start=/'/ skip=/''/  end=/'/ oneline

syn match  cComment          "\v//.*$"
syn region cBlockComment start="\/\*" end="\*\/"

syn match  cFunction         "\w\+\s*\n\?\s*\ze("
syn region cParentheses matchgroup=cParenthesis contains=ALLBUT,cParenthesis
    \ start="(" end=")"

syn match cDefine            "#\(define\|undef\)"
syn match cDefinition        "#\(define\|undef\)\s\+\w*\s\+"
    \ contains=cDefine

hi link cInclude                Include
hi link cPreProc                PreProc
hi link cPreCondit              PreCondit
hi link cKeyword                Keyword
hi link cControlTransfer        Keyword
hi link cLabel                  Label
hi link cSpecial                Special
hi link cConditional            Conditional
hi link cRepeat                 Repeat
hi link cFunction               Function
hi link cDefine                 Define
hi link cDefinition             Constant
hi link cComment                Comment
hi link cBlockComment           Comment
hi link cOperator               Operator
hi link cNumber                 Number
hi link cFloat                  Float
hi link cString                 String
hi link cChar                   String
hi link cConstant               Constant
hi link cStructure              Structure
hi link cStorageClass           StorageClass
hi link cSpecialChar            SpecialChar
hi link cParenthesis            Brace
hi link cBrace                  Brace
hi link cBoolean                Boolean
hi link cTodo                   Todo
hi link cType                   Type

let b:current_syntax = "c"
