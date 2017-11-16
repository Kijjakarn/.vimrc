inoremap <BS> <Space><BS><c-o>:call <SID>Backspace()<cr>

" When backspace is pressed, try to set the indent of the current line to a line
" above it
function! s:Backspace()
    let current_line_number = line('.')
    if getline(current_line_number) =~# '^\s\+$'
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
        call feedkeys("\<BS>", 'n')
    endif
endfunction
