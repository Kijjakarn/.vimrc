set nocompatible              " be iMproved, required
filetype off                  " required

if has('gui_running')
    set guifont=SFMono-Light:h12
endif

set foldmethod=marker
set foldopen=all
set foldclose=all
set autoindent
set splitbelow
set splitright
set autoread

set rtp+=~/.vim/ftdetect

" Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" }}}

" Status Line {{{
" set laststatus=2
" set statusline=%f	    " Path to file
" set statusline+=%=    " Switch to the right side
" set statusline+=%l	" Current line
" set statusline+=/	    " Separator
" set statusline+=%L	" Total lines
" }}}

" Basic Settings {{{
set hidden
set number
set cursorline
set nohlsearch
set incsearch
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set textwidth=80
set ignorecase
set nowrap
set backspace=indent,eol,start
set history=100
set ruler
set showcmd

highlight Error NONE
" }}}

" Syntax {{{
syntax enable
set t_Co=256
syntax on
colo molokai
set colorcolumn=80
highlight ColorColumn ctermbg=7
let g:rehash256=1
let s:molokai_original=1
" }}}

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

let mapleader = ","
let maplocalleader = "-"

" Commenting {{{
augroup comment_line_and_block
	autocmd!
	autocmd FileType c,verilog,cpp,java,javascript,swift nnoremap <leader>c I// <esc>
    " Uncomment
    autocmd FileType c,verilog,cpp,java,javascript,swift nnoremap <leader>C mZ?\/\*<cr>3x/\*\/<cr><left>3x`Z
    " Comment selected text
    autocmd FileType c,verilog,cpp,java,javascript,swift vnoremap <leader>c <esc>`<I/* <esc>`>a */<esc>k0
    " autocmd FileType c,verilog,cpp,java,javascript,swift vnoremap <leader>c <esc>`<<c-v>`>I// <esc>
augroup END

" Synchronizing {{{
augroup sync_all
    autocmd!
    autocmd BufRead * syntax sync minlines=200
augroup END
" }}}

augroup comment_haskell
	autocmd!
	autocmd FileType haskell nnoremap <leader>c I-- <esc>
    " Uncomment
    autocmd FileType haskell nnoremap <leader>C mZ?{-<cr>3x/-}<cr><left>3x`Z
    " Comment selected text
    autocmd FileType haskell vnoremap <leader>c <esc>`<i{- <esc>`>a -}<esc>k0
augroup END
" }}}

" Placeholder for file indentation in Swift {{{
augroup filetype_swift
    autocmd!
    autocmd FileType swift set smartindent
augroup END
" }}}

" Turn off tex file indentations {{{
augroup filetype_tex
	autocmd!
	autocmd FileType tex :set smartindent
	autocmd FileType tex :set formatoptions+=w
augroup END
" }}}

" HTML {{{
augroup filetype_html
	autocmd!
	autocmd FileType html nnoremap <buffer> <leader>f Vatzf
    " Don't wrap
    autocmd FileType html :set tw=0
augroup END
" }}}

" Capitalize selected word
inoremap <c-u> <esc>vbUea

" Visual mode mappings {{{
" Put braces around text
vnoremap <leader>( <esc>`<i(<esc>`><right>a)<esc>
vnoremap <leader>[ <esc>`<i[<esc>`><right>a]<esc>
vnoremap <leader>{ <esc>`<i{<esc>`><right>a}<esc>
vnoremap <leader>< <esc>`<i<<esc>`><right>a><esc>
" Reformat wrapping on selected lines
vnoremap Q <esc>`>o<esc>`<V`>Jgq<cr>dd
" Wrap selected text in double quote
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>v
" Wrap selected text in single quote
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>v
" Paste yanked
vnoremap <c-P> "0P
" Paste yanked
vnoremap <c-p> "0p
" }}}

" Normal mode mappings {{{
" Grep current Word
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" Change window
nnoremap <leader>ee <c-w><c-w>
" Edit vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" Indent to the match previous indentation according to preceding line
nnoremap <leader><tab> ddO
" Shortcut for opening NERDTree
nnoremap <leader>nt :NERDTree<cr>
" Add semicolon at end of line
nnoremap <leader>; :execute "normal! mqA;\e`q"<cr>
" Highlight trailing whitespaces
nnoremap <leader>w :match Error /\v\s+$/<cr><c-o>
" Remove trailing whitespace highlights
nnoremap <leader>W :match none /\v\s+$/<cr><c-o>
" Stop highlighting items from last search
nnoremap <leader>h :nohlsearch<cr>
" Copy current directory to clipboard
nnoremap <silent> <leader>d :let @*=shellescape(getcwd())<cr>
" Paste yanked
nnoremap <c-P> "0P
" Paste yanked
nnoremap <c-p> "0p
" Go into insert mode with corrent indentation
nnoremap <c-i> ddO
" }}}

" Operator mappings {{{
" Change text in next brace
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in< :<c-u>normal! f<vi<<cr>
" Change text in last brace
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap il< :<c-u>normal! F>vi<<cr>
" Change text enclosed by $
onoremap i$  :<c-u>execute "normal! ?\\$\rlv/\\$\rh"<cr>
onoremap a$  :<c-u>execute "normal! ?\\$\rv/\\$\r"<cr>
" }}}
