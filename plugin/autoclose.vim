inoremap <silent> <esc> <esc>:call <SID>ClearOpenedStack()<cr>
inoremap <c-j> <c-o>:call <SID>ControlJToEscape()<cr>
inoremap " "<c-o>:call <SID>DoubleQuote()<cr>
inoremap [<esc> [<esc>
inoremap [ [<c-o>:call <SID>OpenBracket()<cr>
inoremap ] <c-o>:call <SID>CloseBracket()<cr>
inoremap [<bs> <nop>
inoremap [<cr> [<cr>]<esc>O
inoremap {<esc> {<esc>
inoremap { {<c-o>:call <SID>OpenBrace()<cr>
inoremap } <c-o>:call <SID>CloseBrace()<cr>
inoremap {<bs> <nop>
inoremap {<cr> {<cr>}<esc>O
inoremap {<space> {<space><space>}<esc><left>i
inoremap (<esc> (<esc>
inoremap ( (<c-o>:call <SID>OpenParenthesis()<cr>
inoremap ) <c-o>:call <SID>CloseParenthesis()<cr>
inoremap (<bs> <nop>
inoremap (<cr> (<cr>)<esc>O

augroup autoclose_single_quote
    autocmd!
    autocmd FileType python,javascript,html inoremap <buffer> ' '<c-o>:call <SID>SingleQuote()<cr>
augroup END

augroup autoclose_single_angle_bracket
    autocmd!
    autocmd FileType html inoremap <<esc> <<esc>
    autocmd FileType html inoremap < <<c-o>:call <SID>OpenAngleBracket()<cr>
    autocmd FileType html inoremap > <c-o>:call <SID>CloseAngleBracket()<cr>
    autocmd FileType html inoremap <<bs> <nop>
    autocmd FileType html inoremap <<cr> <<cr>><esc>O
augroup END

let g:opened_stack = []

function! s:ClearOpenedStack()
    let g:opened_stack = []
endfunction

function! s:ControlJToEscape()
    while !empty(g:opened_stack)
        let top_element = remove(g:opened_stack, 0)
        if     top_element == 'p'
            call feedkeys("\<esc>f)a", 'n')
        elseif top_element == 'b'
            call feedkeys("\<esc>f}a", 'n')
        elseif top_element == 'k'
            call feedkeys("\<esc>f]a", 'n')
        elseif top_element == 'a'
            call feedkeys("\<esc>f>a", 'n')
        elseif top_element == 'q'
            call feedkeys("\<esc>f\"a", 'n')
        elseif top_element == 's'
            call feedkeys("\<esc>f\'a", 'n')
        endif
    endwhile
endfunction

function! s:DoubleQuote()
    if !empty(g:opened_stack)
        let top_element = g:opened_stack[0]
        if top_element == 'q'
            call feedkeys("\<esc>f\"s", 'n')
            call remove(g:opened_stack, 0)
        else
            call feedkeys("\"\<esc>i", 'n')
            call insert(g:opened_stack, 'q')
        endif
    else
        call feedkeys("\"\<esc>i", 'n')
        call insert(g:opened_stack, 'q')
    endif
endfunction

function! s:SingleQuote()
    if !empty(g:opened_stack)
        let top_element = g:opened_stack[0]
        if top_element == 's'
            call feedkeys("\<esc>f\'s", 'n')
            call remove(g:opened_stack, 0)
        else
            call feedkeys("\'\<esc>i", 'n')
            call insert(g:opened_stack, 's')
        endif
    else
        call feedkeys("\'\<esc>i", 'n')
        call insert(g:opened_stack, 's')
    endif
endfunction

function! s:OpenBracket()
    call feedkeys("]\<esc>i", 'n')
    call insert(g:opened_stack, 'k')
endfunction

function! s:CloseBracket()
    if !empty(g:opened_stack)
        let top_element = g:opened_stack[0]
        if top_element == 'k'
            call feedkeys("\<esc>f]a", 'n')
            call remove(g:opened_stack, 0)
        else
            call feedkeys("]", 'n')
        endif
    else
        call feedkeys("]", 'n')
    endif
endfunction

function! s:OpenAngleBracket()
    call feedkeys(">\<esc>i", 'n')
    call insert(g:opened_stack, 'a')
endfunction

function! s:CloseAngleBracket()
    if !empty(g:opened_stack)
        let top_element = g:opened_stack[0]
        if top_element == 'a'
            call feedkeys("\<esc>f>a", 'n')
            call remove(g:opened_stack, 0)
        else
            call feedkeys(">", 'n')
        endif
    else
        call feedkeys(">", 'n')
    endif
endfunction

function! s:OpenBrace()
    call feedkeys("}\<esc>i", 'n')
    call insert(g:opened_stack, 'b')
endfunction

function! s:CloseBrace()
    if !empty(g:opened_stack)
        let top_element = g:opened_stack[0]
        if top_element == 'b'
            call feedkeys("\<esc>f}a", 'n')
            call remove(g:opened_stack, 0)
        else
            call feedkeys("}", 'n')
        endif
    else
        call feedkeys("}", 'n')
    endif
endfunction

function! s:OpenParenthesis()
    call feedkeys(")\<esc>i", 'n')
    call insert(g:opened_stack, 'p')
endfunction

function! s:CloseParenthesis()
    if !empty(g:opened_stack)
        let top_element = g:opened_stack[0]
        if top_element == 'p'
            call feedkeys("\<esc>f)a", 'n')
            call remove(g:opened_stack, 0)
        else
            call feedkeys(")", 'n')
        endif
    else
        call feedkeys(")", 'n')
    endif
endfunction
