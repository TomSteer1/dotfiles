call plug#begin('~/.config/nvim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
call plug#end()

set autoindent
set number
set tabstop=4
set shiftwidth=4

map <F5> :NERDTreeTabsToggle<CR>
map d :bd<CR>
