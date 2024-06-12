call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-plug'
Plug 'Yazeed1s/minimal.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'vim-scripts/bufferlist.vim'
Plug 'mg979/vim-visual-multi'
Plug 'raimondi/delimitMate'

call plug#end()

let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-json', 'coc-snippets']

let g:ale_linters = {
\   'rust': ['cargo', 'rust-clippy'],
\}
let g:ale_fixers = {
\   'rust': ['rustfmt'],
\}

let g:copilot_no_tab_map = v:true
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/" --glob "!vendor/" --glob "!target/"'
let g:fzf_command_prefix = 'Fzf'
let g:ale_rust_cargo_use_clippy = 1
let g:VM_default_mappings = 1

if exists('g:neovide')
    let g:neovide_font_size = 18
    let g:neovide_font = 'FiraCode Nerd Font:h18'
endif

let NERDTreeShowHidden=1

syntax enable

colorscheme minimal

set background=dark
set relativenumber
set number
set fillchars=eob:\ 

command! FzfFilesAll call fzf#run({'source': 'rg --files --hidden', 'sink': 'e', 'down': '40%'})

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>"
inoremap <silent><expr> <C-p> pumvisible() ? "\<C-p>" : "\<C-p>"

nnoremap <silent> <space>f :FzfFiles<CR>
nnoremap <silent> <space>F :FzfFilesAll<CR>
nnoremap <silent> <space>e :NvimTreeToggle<CR>
nnoremap <silent> <space><Tab> :b#<CR>
nnoremap <silent> <space>1 :BufferLineGoToBuffer 1<CR>
nnoremap <silent> <space>2 :BufferLineGoToBuffer 2<CR>
nnoremap <silent> <space>3 :BufferLineGoToBuffer 3<CR>
nnoremap <silent> <space>4 :BufferLineGoToBuffer 4<CR>
nnoremap <silent> <space>5 :BufferLineGoToBuffer 5<CR>
nnoremap <silent> <space>6 :BufferLineGoToBuffer 6<CR>
nnoremap <silent> <space>7 :BufferLineGoToBuffer 7<CR>
nnoremap <silent> <space>8 :BufferLineGoToBuffer 8<CR>
nnoremap <silent> <space>9 :BufferLineGoToBuffer 9<CR>
nnoremap <silent> <space>0 :BufferLineGoToBuffer 10<CR>

cnoremap <silent><expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>"
cnoremap <silent><expr> <C-p> pumvisible() ? "\<C-p>" : "\<C-p>"

lua require('plugins.nvim-tree')
lua require('plugins.lualine')
lua require('plugins.bufferline')
