function! s:RemoveTrailingWhitespace()
    " Don't remove trailing whitespace on these files
    if &ft =~ 'pdf'
        return
    endif
    %s/\s\+$//e
endfunction

augroup remove_whitespace
    autocmd!
    autocmd BufWritePre * call <SID>RemoveTrailingWhitespace()
augroup END
