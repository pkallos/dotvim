" Include GOROOT as path
set rtp+=$GOROOT/misc/vim
" Syntax highlighting
syntax on
" Ignore case in searches
set ignorecase
" Number lines by default
set number
" Allow backspace in insert mode
set backspace=indent,eol,start

" Use 4 space soft tabs, autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" Use 256 colors
set t_Co=256

" Syntax highlighting for Drupal filetypes
if has("autocmd")
    " Drupal *.module and *.install files.
    augroup module
        autocmd BufRead,BufNewFile *.module set filetype=php
        autocmd BufRead,BufNewFile *.batch set filetype=php
        autocmd BufRead,BufNewFile *.engine set filetype=php
        autocmd BufRead,BufNewFile *.install set filetype=php
        autocmd BufRead,BufNewFile *.test set filetype=php
        autocmd BufRead,BufNewFile *.inc set filetype=php
        autocmd BufRead,BufNewFile *.profile set filetype=php
        autocmd BufRead,BufNewFile *.view set filetype=php
    augroup END
endif

" Open tag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Toggle line numbers with F2
nnoremap <F2> :set nonumber!<CR>

" Toggle paste mode with F3
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

" Show current mode
set showmode

" Use tags in current dir
set tags=tags

" Impove tab completion
set wildmode=longest,list,full
set wildmenu
colorscheme jellybeans

" Strip trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
autocmd BufWritePre * :call StripWhitespace()
