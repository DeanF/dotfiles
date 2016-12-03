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
Plugin 'mileszs/ack.vim'
Plugin 'davidhalter/jedi-vim'

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

" These are style based:
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=4 sts=4 sw=4 autoindent
autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType sass setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab autoindent
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab autoindent
autocmd FileType python set colorcolumn=80 autoindent
autocmd BufWrite *.py call Flake8()

set encoding=utf-8

" Show line numbers
set nu

set noswapfile

" Use global clipboard
set clipboard=unnamedplus

let g:ctrlp_open_new_file = 't'
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "2"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r""

let mapleader = ","
map <leader>m :NERDTreeToggle<CR>
map <leader>k :tabprevious<CR>
map <leader>l :tabnext<CR>

" enable venv
py3 << EOF
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
set backspace=indent,eol,start
