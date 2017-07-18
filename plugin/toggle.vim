nnoremap <silent> <leader>F :call <SID>FoldColumnToggle()<cr>
function! s:FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

nnoremap <silent> <leader>f :call <SID>ExpandFoldUnderCursorToggle()<cr>
function! s:ExpandFoldUnderCursorToggle()
    if &foldopen ==# "all"
        setlocal foldopen&
    else
        setlocal foldopen=all
    endif
endfunction

nnoremap <silent> <leader>q :call <SID>QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
