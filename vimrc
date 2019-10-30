syntax on
set nocompatible
filetype off
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" Enhance command-line completion
set wildmenu
" On pressing tab, insert spaces
set expandtab
" Set line numbers
set number
" Set the cursor line
" set cursorline
" Set the cursor column
" set cursorcolumn
" Highlight the search results
set hlsearch
" Allow insensitve case search
set ignorecase
" Allow dynamic highlighting of search results
set incsearch
" Set status line
set laststatus=2
" Set the key timeout
set timeout timeoutlen=1500
" Use OS Clipboard
set clipboard=unnamed
" allow backspace in insert mode
set backspace=indent,eol,start
" set encoding to utf-8
set encoding=UTF-8
" set the mapleader
let mapleader = ","

" Activate Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'jreybert/vimagit'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'edkolev/promptline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'lumiliet/vim-twig'
Plugin 'groenewege/vim-less'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'lambdalisue/vim-pyenv'
" for more information about vim-fugitive:
" http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'posva/vim-vue'
Plugin 'mbbill/undotree'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'hashivim/vim-terraform'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-eunuch'
Plugin 'jparise/vim-graphql'
Plugin 'tpope/vim-surround'
Plugin 'kshenoy/vim-signature'
Plugin 'jvirtanen/vim-hcl'
Plugin 'mhinz/vim-startify'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

Plugin 'johngrib/vim-game-code-break'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" TODO: change to proper node
let g:coc_node_path = '/Users/asolis/.nvm/versions/node/v12.9.1/bin/node'
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use :Prettier to format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:airline_powerline_fonts = 1

" UndoTree
" using relative positioning instead
let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Extesion configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#vimagit#enabled = 1
let g:bufferline_echo = 0

" Show ignored files in NERDTree status
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIgnore=['\.pyc$', '__pycache__', '\.aux$']
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" If NERDTree is not showing proper icons set the LC_ALL to some valid one
" command is: locale

let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1

if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let g:jedi#force_py_version = pyenv#python#get_internal_major_version()
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif

let g:vrc_curl_opts = {'--progress-bar': ''}

let g:SuperTabDefaultCompletionType = "<F9>"

" CTRL P ignore directories
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|__pycache__'

" Create a shortcut for the Tagbar
nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarOpenAutoClose<CR>

filetype plugin indent on
if has("autocmd")
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
        autocmd BufNewFile,BufRead *.hbs setfiletype hbs syntax=html
endif
