set nocompatible
set laststatus=2
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/NerdTree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'klen/python-mode'
Plugin 'embear/vim-localvimrc'
Plugin 'janko-m/vim-test'
Plugin 'ekalinin/Dockerfile.vim'

call vundle#end()
" Split navigation shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable fold with spacebar
nnoremap <space> za


" FileType settings
filetype on
filetype indent on
filetype plugin on

autocmd BufNewFile,BufRead *.rss set filetype=xml

autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

" These are style based:
autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType sass setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType scala setlocal ts=2 sts=2 sw=2 expandtab

au filetype html set omnifunc=htmlcomplete#CompleteTags
au filetype css set omnifunc=csscomplete#CompleteCSS
au filetype javascript set omnifunc=javascriptcomplete#CompleteJS
au filetype c set omnifunc=ccomplete#Complete
au filetype php set omnifunc=phpcomplete#CompletePHP
au filetype ruby set omnifunc=rubycomplete#Complete
au filetype python set omnifunc=pythoncomplete#Complete
au filetype xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete colorcolumn=80
autocmd FileType python set autoindent
autocmd FileType javascript set autoindent
autocmd BufWrite *.py call Flake8()

set encoding=utf-8

" Show line numbers
set nu

set noswapfile

" Use global clipboard
set clipboard=unnamed

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command='new-tab'
let g:ctrlp_open_new_file = 't'
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0

let mapleader = ","
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>m :NERDTreeToggle<CR>
map <leader>k :tabprevious<CR>
map <leader>l :tabnext<CR>

map <leader>bb :YcmCompleter GoToReferences<CR>

" enable venv
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" enable highlighting syntax
let python_highlight_all=1
syntax on

" Detect malformed whitespace
highlight BadWhitespace ctermbg=red guibg=red
au filetype python,c,php,html,javascript match BadWhitespace /\s\+$/
au filetype python match BadWhitespace /\t\+/


" Hide unwanted files
let NERDTreeIgnore=['\.pyc$', '\~$']

let g:Powerline_symbols = 'fancy'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so)$'
  \ }

set background=dark
colorscheme solarized
