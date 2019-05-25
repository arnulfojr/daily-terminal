syntax on
set nocompatible
filetype off
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" Enhance command-line completion
set wildmenu
" On pressing tab, insert 2 spaces
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
set clipboard=unnamedplus
" Allow backspacing
set backspace=indent,eol,start
" Set the leader as the mac
let mapleader=","

if has("autocmd")
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
        autocmd BufNewFile,BufRead *.hbs setfiletype hbs syntax=html
endif

" Activate Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'jreybert/vimagit'
Plugin 'airblade/vim-gitgutter'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'edkolev/promptline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'lumiliet/vim-twig'
Plugin 'groenewege/vim-less'
Plugin 'majutsushi/tagbar'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'posva/vim-vue'
Plugin 'davidhalter/jedi-vim'
" for more information about vim-fugitive:
" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'mbbill/undotree'
Plugin 'tmux-plugins/vim-tmux-focus-events'
" Plugin 'Valloric/YouCompleteMe'
 Plugin 'w0rp/ale'
" Color plugins:
Plugin 'neutaaaaan/iosvkem'
" Plugin 'fenetikm/falcon'
Plugin 'rhysd/vim-grammarous'
Plugin 'isobit/vim-caddyfile'
Plugin 'chrisbra/csv.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
"Plugin 'vim-vdebug/vdebug'
Plugin 'edkolev/tmuxline.vim'
Plugin 'auxiliary/vim-layout'
Plugin 'hashivim/vim-hashicorp-tools'

call vundle#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" pencil
let g:airline_section_x = '%{PencilMode()}'

" Goyo
let g:goyo_width = '75%'

" GoyoEnter
function! s:goyo_enter()
  set nocursorline
  set nocursorcolumn
  Limelight
  Pencil
  " Quit even if Goyo is active
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

" GoyoLeave
function! s:goyo_leave()
  set cursorline
  set cursorcolumn
  Limelight!
  PencilOff
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

" Register the Goyo Events
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" UndoTree
" using relative positioning instead
let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Extesion configuration
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#vimagit#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0 

let g:bufferline_echo = 0

let g:csv_start = 1
let g:csv_end = 256

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard', 'jshint']
let g:syntastic_javascript_standard_generic = 1
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
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
let g:NERDTreeIgnore=['\.pyc$', '__pycache__', '\.aux$']

" ControlP
let g:ctrlp_custom_ignore = 'node_modules\|git'

" Ale linting
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'css': ['prettier']}

" Create a shortcut for the Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>
nmap <F2> :NERDTreeToggle<CR>

filetype plugin indent on

