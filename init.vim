let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-commentary'
"Plug 'jiangmiao/auto-pairs'

Plug 'nvim-lualine/lualine.nvim'

Plug 'lisposter/vim-blackboard'
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark='hard'
Plug 'rakr/vim-one'
let g:one_allow_italics = 1
Plug 'NLKNguyen/papercolor-theme'
Plug 'kkga/vim-envy'

Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v3.x' }
nnoremap <silent> <C-b> :Neotree toggle source=buffers dir=~<CR>

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



Plug 'tpope/vim-fugitive'
source $HOME/.config/nvim/fugitive-gitfarm.vim

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

nnoremap <leader>qb :bp\|bd #<CR>
nnoremap <leader>qw :bd<CR>:q<CR>
nnoremap <C-n> :Buffers<CR>

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': 'master'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch': 'master'}

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
if !exists('g:vscode')
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
endif

Plug 'mhinz/vim-startify'


" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'jmckiern/vim-venter'

" Plug 'andymass/vim-matchup'

Plug 'kongo2002/fsharp-vim'






call plug#end()

set termguicolors
set background=dark
colorscheme blackboard
syntax enable

set number relativenumber
set cursorline

set ignorecase
if !exists('g:vscode')
    set hlsearch
endif
set smartcase
"This unsets the "last search pattern" register by hitting return
" nnoremap <CR> :noh<CR>

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set clipboard=unnamed
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=90,125
set foldmethod=expr
set foldexpr=v:lua.vim.treesitter.foldexpr()
set foldlevel=9999
set list
set listchars=tab:→\ ,trail:·,extends:…,precedes:…,nbsp:␣
set signcolumn=yes
set updatetime=250
set scrolloff=8
set splitbelow
set inccommand=split
set lazyredraw
set noshowmode

" Trims trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

set nowrap
autocmd FileType markdown,log,txt setlocal wrap linebreak textwidth=100

" Ensures consistent n and N search direction
nnoremap n nzzzv
nnoremap N Nzzzv

" Automatically reload changed files
set autoread
autocmd CursorHold * checktime

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

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
nnoremap <silent><leader>json :%!python3 -m json.tool<CR>
vnoremap <silent><leader>json :'<,'>!python3 -m json.tool<CR>

nnoremap <silent> <C-j> :cnext<CR>
nnoremap <silent> <C-k> :cprev<CR>

lua << EOF
vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = { 'tsconfig.json', 'package.json', '.git' },
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end,
})
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', '.git' },
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end,
})
vim.lsp.enable({'ts_ls', 'pyright'})

vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
  end,
})

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'python', 'typescript', 'javascript', 'java', 'lua', 'vim', 'vimdoc', 'markdown', 'bash', 'json', 'yaml' },
  highlight = { enable = true },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = { [']m'] = '@function.outer' },
      goto_previous_start = { ['[m'] = '@function.outer' },
    },
  },
})

require('neo-tree').setup({
  default_component_configs = {
    icon = { enabled = false },
  },
  sources = { 'filesystem', 'buffers', 'git_status' },
  filesystem = {
    filtered_items = { visible = true },
  },
  buffers = {
    show_unloaded = true,
    group_empty_dirs = false,
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    renderers = {
      file = {
        { 'indent' },
        { 'name', use_git_status_colors = true },
      },
    },
    window = {
      mappings = {
        ['d'] = 'buffer_delete',
      },
    },
  },
  source_selector = {
    winbar = true,
    sources = {
      { source = 'filesystem', display_name = ' Files' },
      { source = 'buffers', display_name = ' Buffers' },
      { source = 'git_status', display_name = ' Git' },
    },
  },
})

require('lualine').setup()
EOF