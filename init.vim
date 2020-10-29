let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-commentary'
"Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'lisposter/vim-blackboard'
Plug 'morhetz/gruvbox'
set background=dark
let g:gruvbox_contrast_dark='hard'

Plug 'scrooloose/nerdtree'
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <leader>ws :Rg <C-R>=expand("<cword>>")<CR>

Plug 'editorconfig/editorconfig-vim'

" Autocomplete and supersearch!
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source $HOME/.config/nvim/coc.vim
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

Plug 'vim-utils/vim-man'

Plug 'tpope/vim-fugitive'

Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

" Needs livedown to be installed: `npm install -g livedown`:w
" Note that it toggles the server. You can kill with :LivedownKill
Plug 'shime/vim-livedown'
nnoremap <leader>ld :LivedownToggle<CR>

" Adds an indentation test object, e.g. use dii to delete current indentation
" level. Good for python
Plug 'michaeljsmith/vim-indent-object'

Plug 'severin-lemaignan/vim-minimap'

Plug 'qpkorr/vim-bufkill'

call plug#end()

set termguicolors
colorscheme blackboard
syntax enable

set number relativenumber
set nu rnu

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

" Trims trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

set nowrap
autocmd FileType markdown,log,txt setlocal wrap

" Ensures consistent n and N search direction
nmap n /<CR>
nmap N ?<CR>

" Change buffers on Ctrl+n, similar to ReSharper
nnoremap <C-n> :buffers<CR>:b

" Automatically reload changed files
set autoread

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :BD<CR>
nnoremap <leader>- :vertical resize -10<CR>
nnoremap <leader>+ :vertical resize +10<CR>

nnoremap <leader>e <C-^>
vnoremap <leader>p "_dP

nnoremap <silent><leader>json :%!python -m json.tool<CR>

