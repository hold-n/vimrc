let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-commentary'
"Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'

Plug 'lisposter/vim-blackboard'
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark='hard'
Plug 'rakr/vim-one'
let g:one_allow_italics = 1
Plug 'NLKNguyen/papercolor-theme'
Plug 'kkga/vim-envy'

Plug 'scrooloose/nerdtree'
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" ---------------------------
" FZF
" ---------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let $FZF_DEFAULT_OPTS='--reverse --bind ctrl-a:select-all'
" CTRL-A CTRL-Q to select all and build quickfix list
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <C-p> :GFiles<CR>
vnoremap <leader>fs "zy:BLines! <C-R>z<CR>
vnoremap <leader>ws "zy:Rg! <C-R>z<CR>
nnoremap <leader>ws :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fs :BLines!<CR>
nnoremap <leader>gs :Rg!<CR>
nnoremap <leader>fc :Commands!<CR>
"
" ---------------------------
" FZF END
" ---------------------------

Plug 'editorconfig/editorconfig-vim'

" Autocomplete and supersearch!
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source $HOME/.config/nvim/coc.vim
nnoremap <leader>pws :CocSearch <C-R>=expand("<cword>")<CR>

Plug 'vim-utils/vim-man'

Plug 'tpope/vim-fugitive'

Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

" Needs livedown to be installed: `npm install -g livedown`:w
" Note that it toggles the server. You can kill with :LivedownKill
Plug 'shime/vim-livedown'
nnoremap <leader>md :LivedownToggle<CR>

" Adds an indentation test object, e.g. use dii to delete current indentation
" level. Good for python
Plug 'michaeljsmith/vim-indent-object'

Plug 'airblade/vim-rooter'

Plug 'fholgado/minibufexpl.vim'
nnoremap <leader>qb :MBEbd<CR>
nnoremap <leader>qw :MBEbd<CR>:q<CR>
" nnoremap <C-n> :buffers<CR>:b
nnoremap <C-n> :MBEFocus<CR>
let g:miniBufExplVSplit = 40
" let g:miniBufExplShowBufNumbers = 0

Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'

" Stops the usual 'delete' commands from modifying registers.
Plug 'svermeulen/vim-cutlass'
" Sets x to be 'cut'
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

Plug 'mhinz/vim-startify'
let NERDTreeHijackNetrw = 0

Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'jmckiern/vim-venter'

Plug 'andymass/vim-matchup'

Plug 'kongo2002/fsharp-vim'

call plug#end()

set termguicolors
set background=light
colorscheme blackboard
syntax enable

set number relativenumber
set nu rnu
set cursorline

set ignorecase
set hlsearch
set smartcase
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR>

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set clipboard=unnamed
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=90,125
set foldmethod=indent
set foldlevel=9999

" Trims trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

set nowrap
autocmd FileType markdown,log,txt setlocal wrap linebreak textwidth=100

" Ensures consistent n and N search direction
nmap n /<CR>
nmap N ?<CR>

" Automatically reload changed files
set autoread
autocmd CursorHold * checktime

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap <leader>+ :vertical resize +10<CR>

" word replace
nnoremap <leader>wr "zyiw:%s/<C-R>z//g<Left><Left>
vnoremap <leader>wr "zy:%s/<C-R>z//g<Left><Left>

nnoremap <leader>e <C-^>
vnoremap <leader>p "_dP

" Horizontally center cursor position.
" Does not move the cursor itself (except for 'sidescrolloff' at the window
" border).
nnoremap <silent> z. :<C-u>normal! zszH<CR>

" format json
nnoremap <silent><leader>json :%!python -m json.tool<CR>
vnoremap <silent><leader>json :'<,'>!python -m json.tool<CR>

nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprev<CR>

