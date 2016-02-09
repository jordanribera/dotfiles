" Jordan Ribera
" .vimrc scratch file

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source % " reload if writing to .vimrc
command! LoadConf source % " probably silly

" ================
" Hotkeys
" ================

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a " on OSX press ALT and click
set bs=2 " make backspace behave like normal again

" Tab navigation
map <c-h> <esc>:tabprevious<CR>
map <c-l> <esc>:tabnext<CR>

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Activate ctrl-p
let g:ctrlp_map = '<c-p>'


" ================
" Visual Stuff
" ================

" Show trailing whitespace
" MUST be inserted before the colorscheme command
autocmd ColorScheme * highlight ExtraWhiteSpace ctermbg=red guibg=red
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Color scheme
" set t_Co=256
" color wombat256mod
syntax enable
set background=dark
colorscheme solarized

" Enable syntax highlighting
" file reload needed to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text while typing
set colorcolumn=80
highlight ColorColumn ctermbg=235

" Easier formatting of paragraphs
"" vmap Q gq
"" vmap Q gqap


" ================
" Useful settings
" ================

set history=700
set undolevels=700

" Real programmers use spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
"" set hlsearch
"" set incsearh
"" set ignorecase
"" set smartcase

" Disable stupid backup and swap files - they trigger numerous events for
" filesystem watchers
set nobackup
set nowritebackup
set noswapfile

" ================
" Plugins
" ================

" Set up Pathogen to manage plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
"" let g:Powerline_symbols= 'fancy'

" Settings for vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
"" set wildignore+=*/coverage/*

" Settings for vim-flake8
" cd ~/.vim/bundle
" git clone https://github.com/nvie/vim-flake8.git
let g:flake8_show_in_gutter = 1
let g:flake8_show_in_file = 1
"" let g:flake8_show_quickfix = 0
autocmd BufWritePost *.py call Flake8() " automatically flake8 on save

" Settings for vim-markdown
" cd ~/.vim/bundle
" git clone https://github.com/plasticboy/vim-markdown.git
let g:vim_markdown_folding_disabled = 1

" Settings for vim-jedi
" cd ~/.vim/bundle
" git clone --recursive https://github.com/davidhalter/jedi-vim.git
let g:jedi#popup_on_dot = 1

" Settings for NERDTree

