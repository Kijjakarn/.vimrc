inoremap <buffer><expr> <CR> CarriageReturn(line('.'))

function! CarriageReturn(line_number)
    let current_line = getline(a:line_number)
    let block_name = matchstr(current_line, '\\begin{\zs.*\ze}')
    if !empty(block_name)
        if block_name ==# 'document'
            return repeat("\<CR>", 4) . "\\end{" . block_name . "}\<Up>\<Up>"
        endif
        return "\<CR>\<CR>\\end{" . block_name . "}\<Up>"
    endif
    return "\<CR>"
endfunction
