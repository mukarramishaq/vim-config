set directory^=$HOME/.vim/tmp//
set number
set hidden
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

"--> Packages addition START
"<-- Packages addtion END


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'puremourning/vimspector'
call plug#end()


syntax enable
colorscheme codedark

""" source other specialized vimrc files
source ~/.vim/keymaps.vim
source ~/.vim/coc-config.vim

" Ensure vim-fugitive is loaded
runtime! plugin/fugitive.vim

" Configure the statusline
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %{FugitiveStatusline()}

" Vimspector configs
let g:vimspector_enable_mappings = 'HUMAN'
