vnoremap <leader>a :call Align('')<left><left>
vnoremap <leader>: :call AlignSwiftColons()<cr>

" Automatically align the first instances of `c` in each line
function! Align(c) range
    let lines = []
    let position_start = getpos("'<")[2] - 1

    " Get the position of the character `c` in all the lines and also store the
    " splitted lines into `lines`
    let positions = []
    for i in range(a:firstline, a:lastline)
        let line     = split(getline(i), '\zs')
        let position = index(line, a:c, position_start)
        call add(lines, line)
        call add(positions, position)
    endfor

    " Find the number of spaces to insert based on the maximum position, then
    " insert them into the lines
    let position_max = max(positions)
    let index = 0
    for position in positions
        if position > 0
            let spaces = repeat(' ', position_max - position)
            call insert(lines[index], spaces, position)
        endif
        let lines[index] = join(lines[index], '')
        let index += 1
    endfor

    call setline(a:firstline, lines)
endfunction

" Align the colons to the colon in the first line by inserting or removing
" spaces at the beginning of subsequent lines
" Example: stride(from: x,        stride(from: x,
"             to: y,          =>           to: y,
"               by: z                      by: z)
"
function! AlignSwiftColons() range
    let lines = []

    " Get the position of the colon in the first line
    let position_first = index(split(getline(a:firstline), '\zs'), ':')

    " Get the position of the colon in each line and insert/remove the
    " appropriate number of spaces from the beginning of the line
    for i in range(a:firstline + 1, a:lastline)
        let line     = split(getline(i), '\zs')
        let position = index(line, ':')

        " Only align if there is a colon in the current line
        if position > 0
            let offset = position - position_first

            " The colon is farther to the right. Delete the spaces
            if offset > 0
                call remove(line, 0, offset - 1)

            " The colon is farther to the left. Add the spaces
            else
                let spaces = repeat(' ', -offset)
                call insert(line, spaces, 0)
            endif
        endif
        call add(lines, join(line, ''))
    endfor

    call setline(a:firstline + 1, lines)
endfunction
