filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" ***********************************
" GOLANG specifid stuffs
autocmd FileType go setlocal shiftwidth=8 tabstop=8
" ***********************************
" 
" ***********************************
" START: Key mappings
" ***********************************
" clear the highlight after search on hitting Enter
" ref: https://stackoverflow.com/a/662914/1410291
nnoremap <CR> :noh<CR><CR>

" map <Ctrl w> ===> <Alt/Meta w> in INSERT mode
" note: ∑ is emitted by Alt w/Meta w in mac
inoremap ∑ <C-w>

" ***********************************
" END: Key mappings
" ***********************************

" ref:// https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-unimpaired'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" one dark color scheme
Plug 'joshdick/onedark.vim'
" vim polyglot
Plug 'sheerun/vim-polyglot'
" go features
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()

color onedark
