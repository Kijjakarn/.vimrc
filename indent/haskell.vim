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

let s:keyword_map_private =
    \ [ ['do', 1]
    \ , ['where', 1]
    \ , ['in', 1]
    \ , ['let', 1]
    \ , ['if', -2]
    \ , ['then', -4]
    \ ]
let s:symbol_map_private =
    \ [ [' = ', 0]
    \ ]

let s:keywords = map(copy(s:keyword_map_private), 'v:val[0]')
let s:symbols  = map(copy(s:symbol_map_private), 'v:val[0]')

let s:indents = map(s:keyword_map_private, {k, v -> len(v[0]) + v[1]})
let s:indents_with_symbols =
    \ s:indents + map(s:symbol_map_private, {k, v -> len(v[0]) + v[1]})

let s:keyword_regexes = map(copy(s:keywords), {k, v -> '\<' . v . '\>'})
let s:keyword_and_symbol_regexes = s:keyword_regexes + s:symbols

let s:previous_line_keyword_regexes =
    \ '^.*\(' . join(s:keyword_regexes, '\|') . '\).*$'

function! GetHaskellIndent(line_number)
    if a:line_number == 0
        return 0
    endif

    let line = getline(a:line_number)
    let previous_line = getline(a:line_number - 1)
    let previous_indent = indent(a:line_number - 1)

    " The previous line is a comment
    if line =~# '^\s*--.*$'
        return previous_indent
    endif

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
        let equals_index = stridx(previous_line, ' = ')
        if equals_index >= 0
            return equals_index + 1
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

    " There is a keyword in the previous line
    if previous_line =~# s:previous_line_keyword_regexes
        let line_number = a:line_number - 1
        let indents = s:KeywordIndents(line_number)
        let max_indent = max(indents)
        let max_indent_index = index(indents, max_indent)
        return max_indent + s:indents[max_indent_index]
    end

    return previous_indent
endfunction

function! s:KeywordIndents(line_number)
    let indents = []
    for word in s:keyword_regexes
        call add(indents, LastOccurrenceStartIndex(a:line_number, word))
    endfor
    return indents
endfunction

function! HaskellIndentStops(line_number)
    let stops = []
    let index = 0
    for word in s:keyword_and_symbol_regexes
        let start_indexes =
            \ AllOccurrencesStartIndex(getline(a:line_number), word)
        for start_index in start_indexes
            call add(stops, start_index + s:indents_with_symbols[index])
        endfor
        let index += 1
    endfor
    return stops
endfunction

function! NthOccurrenceStartIndex(n, haystack, needle)
    let n = a:n
    if n < 0
        return -1
    endif
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

function! AllOccurrencesStartIndex(haystack, needle)
    let occurrences = []
    let index = [0, 0, 0]
    while index[1] >= 0
        let m = matchstrpos(a:haystack, a:needle, index[2])
        if m[1] >= 0
            let index = m
            call add(occurrences, m[1])
        else
            break
        endif
    endwhile
    return occurrences
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
