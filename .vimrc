set nocompatible
" Include GOROOT as path
set rtp+=$GOROOT/misc/vim
" Syntax highlighting
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'airblade/vim-gitgutter'
Bundle 'tomtom/tcomment_vim'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'derekwyatt/vim-scala'
Bundle 'ack.vim'
Bundle 'surround.vim'

syntax on
filetype off
filetype plugin indent on

" Ignore case in searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Highlight searches
set hlsearch
" Number lines by default
set number
" Allow backspace in insert mode
set backspace=indent,eol,start
" Highlight current line
set cursorline
" Don't cry for me
set visualbell

" Use 4 space soft tabs, autoindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
" Use 256 colors
set t_Co=256

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Toggle line numbers with F2
nnoremap <F2> :set nonumber!<CR>

" Toggle paste mode with F3
nnoremap <F3> :set invpaste paste?<CR>

" select pasted text
nnoremap gp `[v`]

set pastetoggle=<F3>

" Show current mode
set showmode
" Show the title in the current window
set title
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Disable error bells
set noerrorbells
" Show the cursor position
set ruler

" Use tags in current dir
set tags=tags

" Impove tab completion
set wildmode=longest,list,full
set wildmenu

" Set hidden?
set hidden

" Bind ctrl-h and ctrl-j to tabn tabp
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>

" Allow cursor keys in insert mode
set esckeys

" Always show status line
set laststatus=2

" Colors!
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

" Get real with multibyte
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Auto reload files on disk
set autoread

" Gitgutter on
let g:gitgutter_enabled = 1
nnoremap <Leader>n :GitGutterNextHunk<CR>
nnoremap <Leader>p :GitGutterPrevHunk<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

