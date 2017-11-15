nnoremap <c-v> :call <SID>UnmapAll()<cr><c-v>
vnoremap <silent> <esc> <esc>:call <SID>MapAll()<cr>
inoremap <silent> <esc> <esc>:call <SID>EscapeInsert()<cr>

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

function! s:InitializeAutoClose()
    let g:autoclose = 1
    let g:visual_unmapped = 1
    let g:opened_stack = []
    call s:MapAll()
endfunction

function! s:MapAll()
    if g:visual_unmapped
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
        let g:visual_unmapped = 0
    endif
endfunction

function! s:UnmapAll()
    let g:visual_unmapped = 1
    silent! iunmap <c-j>
    silent! iunmap "
    silent! iunmap [<esc>
    silent! iunmap [
    silent! iunmap ]
    silent! iunmap [<bs>
    silent! iunmap [<cr>
    silent! iunmap {<esc>
    silent! iunmap {
    silent! iunmap }
    silent! iunmap {<bs>
    silent! iunmap {<cr>
    silent! iunmap {<space>
    silent! iunmap (<esc>
    silent! iunmap (
    silent! iunmap )
    silent! iunmap (<bs>
    silent! iunmap (<cr>
endfunction

function! s:EscapeInsert()
    call s:ClearOpenedStack()
    call s:MapAll()
endfunction

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

call <SID>InitializeAutoClose()
