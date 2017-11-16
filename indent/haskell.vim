" if exists('b:did_indent')
"     finish
" endif
set noautoindent
let b:did_indent=1

setlocal indentexpr=GetHaskellIndent(v:lnum)
setlocal indentkeys&
setlocal indentkeys+==in

" if exists('*GetHaskellIndent')
"     finish
" endif

function! GetHaskellIndent(line_number)
    if a:line_number == 0
        return 0
    endif

    let line = getline(a:line_number)
    let previous_line = getline(a:line_number - 1)
    let previous_indent = indent(a:line_number - 1)

    " `in` is at the beginning of the line
    if line =~# '^\s*in\>.*$'
        " Search for the corresponding occurrence of `let` by counting the
        " number of `in` in the previous lines
        let line_number = a:line_number - 1
        let lets_count = 0
        let ins_count = 1
        while line_number >= 0
            let line = getline(line_number)
            let lets_count += Count(line_number, '\<let\>')
            let ins_count += Count(line_number, '\<in\>')
            let difference = lets_count - ins_count

            " Assume there the line has the pattern /(let)*(in)*/
            " The current `in` matches a `let` in this line
            if difference >= 0
                return NthOccurrenceStartIndex(difference + 1, line, '\<let\>')
            endif

            let line_number -= 1
        endwhile
        return previous_indent
    endif

    " If the user types `in` not at the beginning of the line, do nothing
    if line =~# '^.*\<in\>.*$'
        return -1
    endif

    " `data` or `newtype` is at the beginning of the previous line
    if previous_line =~# '^\s*\(data\|newtype\)\>.*$'
        " The previous line also contains `=`
        let equals_index = stridx(previous_line, '=')
        if equals_index >= 0
            return equals_index
        endif

        return previous_indent + 4
    endif

    " `case .. of` is at the end of the previous line
    if previous_line =~# '^.*\<case\>.*\<of\s*$'
        " return strridx(previous_line, 'case') + 4
        return LastOccurrenceStartIndex(a:line_number - 1, '\<case\>') + 4
    endif

    " `=` is at the end of the previous line
    if previous_line =~# '^.*\s*=\s*$'
        return previous_indent + 4
    endif

    " `where` is at the end of the previous line
    if previous_line =~# '^.*\<where\s*$'
        " `module`, `instance`, or `class` is at the beginning of the previous
        " line
        if previous_line =~# '^\s*\(module\|class\|instance\)\>.*$'
            return previous_indent + 4
        endif
        return LastOccurrenceStartIndex(a:line_number - 1, '\<where\>') + 2
    endif

    " `do` is at the end of the previous line
    if previous_line =~# '.*\<do\s*$'
        return previous_indent + 4
    endif

    if previous_line =~# '^.*{.*$'
        return strridx(previous_line, '{')
    endif

    " `do`, `where`, `in`, or `let` is in the previous line
    if previous_line =~# '^.*\<\(do\|where\|in\|let\)\>.*$'
        let line_number = a:line_number - 1
        let do_position    = LastOccurrenceStartIndex(line_number, '\<do\>')
        let where_position = LastOccurrenceStartIndex(line_number, '\<where\>')
        let in_position    = LastOccurrenceStartIndex(line_number, '\<in\>')
        let let_position   = LastOccurrenceStartIndex(line_number, '\<let\>')
        let max_position = max([do_position, where_position, in_position, let_position])
        if do_position == max_position
            return do_position + 3
        elseif where_position == max_position
            return where_position + 6
        elseif in_position == max_position
            return in_position + 3
        elseif let_position == max_position
            return let_position + 4
        endif
    end

    return previous_indent
endfunction

function! NthOccurrenceStartIndex(n, haystack, needle)
    let n = a:n
    let index = [0, 0, 0]
    while n >= 0
        let m = matchstrpos(a:haystack, a:needle, index[2])
        if m[1] >= 0
            let index = m
        else
            return index[1]
        endif
        let n -= 1
    endwhile
    return index[1]
endfunction

function! LastOccurrenceStartIndex(line_number, pattern)
    let cnt = Count(a:line_number, a:pattern)
    return NthOccurrenceStartIndex(cnt - 1, getline(a:line_number), a:pattern)
endfunction

function! Count(line_number, pattern)
    redir => cnt
        silent! exe (a:line_number . 's/' . a:pattern . '//gn')
    redir END
    return strpart(cnt, 1) + 0
endfunction
