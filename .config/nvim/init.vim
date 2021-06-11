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
" rust support
Plug 'rust-lang/rust.vim'
" enable auto format of rust
let g:rustfmt_autosave = 1
" fuzzy finder 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General fuzzy finder

" Initialize plugin system
call plug#end()

color onedark

" ***********************************
" START: Status line color changes
" ***********************************
" define the necessary colors
" ref: https://stackoverflow.com/questions/48271865/vim-whats-the-best-way-to-set-statusline-color-to-change-based-on-mode
hi NormalColor guifg=Black guibg=Green ctermbg=236 ctermfg=245
hi InsertColor guifg=Black guibg=Cyan ctermbg=63 ctermfg=15
hi ReplaceColor guifg=Black guibg=maroon1 ctermbg=230 ctermfg=0
" Set ctermbg, ctermfg to show the status line c:olor
" hi VisualColor guifg=Black guibg=Orange ctermbg=NONE ctermfg=NONE
hi VisualColor guifg=Black guibg=Orange ctermbg=236 ctermfg=15

 
" initially clear the status line
set statusline=

" always show the status line
set laststatus=2

" map the colors to status line
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(mode()=='V')?'\ \ VISUAL\ ':''}
" ***********************************
" END: Status line color changes
" ***********************************
