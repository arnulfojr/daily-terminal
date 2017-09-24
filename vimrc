syntax on
set nocompatible
filetype off
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" Enhance command-line completion
set wildmenu
" On pressing tab, insert 4 spaces
set expandtab
" Set line numbers
set number
" Set the cursor line
set cursorline
" Highlight the search results
set hlsearch
" Allow insensitve case search
" set ignorecase
" Allow dynamic highlighting of search results
set incsearch
" Set status line
set laststatus=2
" Set the key timeout
set timeout timeoutlen=1500
" Use OS Clipboard
set clipboard=unnamed

if has("autocmd")
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
        autocmd BufNewFile,BufRead *.hbs setfiletype hbs syntax=html
endif

" Activate Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'jreybert/vimagit'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'edkolev/promptline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'Townk/vim-autoclose'
Plugin 'lumiliet/vim-twig'
Plugin 'groenewege/vim-less'
Plugin 'majutsushi/tagbar'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
" for more information about vim-fugitive:
" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Extesion configuration
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#vimagit#enabled = 1

let g:bufferline_echo = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
" dismiss the warnings for AngularJs nG attributes in the html tidy section
let g:syntastic_html_tidy_ignore_errors = ["proprietary attribute \"ng-"]
" NERDTREE configuration
" nerdtree starts auto all the time
" autocmd vimenter * NERDTree
" only when no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show ignored files in NERDTree status
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIgnore=['\.pyc$']

" Create a shortcut for the Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>
nmap <F2> :NERDTreeToggle<CR>

filetype plugin indent on

