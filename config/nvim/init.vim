call plug#begin('~/.config/nvim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  
	Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	Plug 'github/copilot.vim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'b0o/schemastore.nvim'

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	
	Plug 'ellisonleao/gruvbox.nvim'

	Plug 'simrat39/symbols-outline.nvim'

	Plug 'junnplus/lsp-setup.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'

	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'

	Plug 'romgrk/barbar.nvim'
	
	Plug 'lervag/vimtex'

	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'tpope/vim-surround'

	Plug 'mbbill/undotree'


call plug#end()

filetype plugin on

set autoindent
set number
set tabstop=2
set shiftwidth=2
set ic
set clipboard=unnamedplus
set undofile
" Theme

colorscheme gruvbox
"colorscheme tokyonight-night

" Auto Complete

runtime cmp.vim
runtime source-outline.vim

luafile ~/.config/nvim/lua/lsp.lua

" Auto Commands

autocmd BufNew,BufRead *.nasm set ft=nasm
autocmd BufNew,BufRead *.startup set ft=sh
" Copilot settings

"let g:copilot_node_command = "/home/tom/.nvm/versions/node/v17.9.1/bin/node"
let g:copilot_filetypes = {"yaml": v:true}  


" Binds

map <F5> :NERDTreeTabsToggle<CR>
map <F6> :Telescope buffers<CR>
map <F7> :Telescope find_files<CR>
map <F8> :UndotreeToggle<CR>
map <F9> :bd<CR>

" vim-snippets

let g:UltiSnipsExpandTrigger="<F8>"
let g:vimtex_view_method="zathura"
