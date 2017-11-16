inoremap <BS> <Space><BS><c-o>:call <SID>Backspace()<cr>

" When backspace is pressed, try to set the indent of the current line to a line
" above it
function! s:Backspace()
    let current_line_number = line('.')
    let current_line = getline(current_line_number)
    if current_line =~# '^\s\+$'
        let current_indent = indent(current_line_number)
        let line_number = current_line_number - 1
        let indent = indent(line_number)
        while current_indent <= indent && line_number >= 0
            let line_number -= 1
            let indent = indent(line_number)
        endwhile
        call setline(current_line_number, join(repeat([' '], indent), ''))
        call cursor(current_line_number, indent)
    else
        if g:autoclose
            let cursor_column = col("'^")
            let left_character = current_line[cursor_column - 2]
            let right_character = current_line[cursor_column - 1]
            if    left_character ==# '(' && right_character ==# ')'
             \ || left_character ==# '[' && right_character ==# ']'
             \ || left_character ==# '{' && right_character ==# '}'
             \ || left_character ==# '"' && right_character ==# '"'
             \ || left_character ==# "'" && right_character ==# "'"
                " Pop the character from the stack
                call remove(g:opened_stack, 0)

                " Delete the right character
                call feedkeys("\<Right>\<BS>", 'n')
            endif
        endif
        call feedkeys("\<BS>", 'n')
    endif
endfunction
