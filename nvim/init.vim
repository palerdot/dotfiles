filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" clear the highlight after search on hitting Enter
" ref: https://stackoverflow.com/a/662914/1410291
nnoremap <CR> :noh<CR><CR>



" ref:// https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" one dark color scheme
Plug 'joshdick/onedark.vim'
" vim polyglot
Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()

color onedark
