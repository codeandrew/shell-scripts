set nu
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
syntax on
""colorscheme desert

set nocompatible              " required
filetype off                  " required

""""""""""""""""""""""""
"" VIM VUNDLE CONFIG  
""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""
"" IDE CONFIG
""""""""""""""""""""""

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"" Fold Plugin
Plugin 'tmhedberg/SimpylFold'

"" to see the docstrings for folded code
let g:SimpylFold_docstring_preview=1


"" Indent for python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"" Indent for HTML, CSS, JS
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"" UTF-8 Support 
set encoding=utf-8

"" Auto Complete
Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"" Syntax Checking/Highlighting
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1

"" Color Scheme Plugin
"" Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

"" File Browsing 
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
source ~/.vim/plugin/nerdtree.vim

"" Super Searching 
Plugin 'kien/ctrlp.vim'

"" GIT integration 
Plugin 'tpope/vim-fugitive'

"" Syntax Import 
source ~/.vim/syntax/python.vim
source ~/.vim/syntax/javascript.vim

"" VueJs
Plugin 'posva/vim-vue'
let g:vue_disable_pre_processors = 1

"" HTML5 syntax 
Plugin 'othree/html5.vim'

"" Other JS syntax
Plugin 'othree/yajs.vim'

"" SCSS Syntax 
Plugin 'cakebaker/scss-syntax.vim'


