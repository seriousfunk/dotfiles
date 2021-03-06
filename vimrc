execute pathogen#infect() 
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set nocompatible
set t_Co=256              " enable 256-color mode.
set showmatch             " automatically show matching brackets
" Disable annoying beeping (causes strange 001B character in terminal)
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
"set vb                    " use visual bell instead of annoying errorbells
syntax enable             " enable syntax highlighting (previously syntax on).
set number                " show line numbers
set laststatus=2          " last window always has a statusline
set hlsearch              " Highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
" Set <F2> as a toggle for paste mode so it doesn't auto-indent
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" Map <C-L> (Ctrl-C-L,redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>
set background=light
colorscheme solarized8
let g:airline_theme='archery'
" Map <F5> to toggle background color from light to dark
nnoremap <f5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
