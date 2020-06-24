
"Vundle Scripts-------------------------------
"Install Vundle: git clone https://github.com/VundleVim/Vundle.vim.git ~/Dropbox/vim/bundle/Vundle.vims
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'rust-lang/rust.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'psliwka/vim-smoothie'
Plugin 'tpope/vim-fugitive'
Plugin 'keith/swift.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"~/.vim/bundle/Vundle.vims
"End Vundle Scripts
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Syntastic Scripts-----------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['cargo']
let g:rustfmt_autosave = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

hi SpellBad ctermfg=136 ctermbg=124
hi SpellCap ctermfg=136 ctermbg=124
"End Syntastic Scripts-------------------------


filetype plugin indent on       " Automatically detect file types.
syntax enable                   " syntax highlighting
set nocompatible                " Don't pretend to be vi

set mouse=a                     " automatically enable mouse usage
set viewoptions=folds,options,cursor,unix,slash
                                " better unix / windows compatibility
set virtualedit=onemore         " allow for cursor beyond last character
set history=1000                " Store a ton of history (default is 20)
set backspace=indent,eol,start " backspace over everything in insert mode

set linespace=0                 " No extra spaces between rows
set ruler
set rnu                         " Relative line numbers
set nu                          " Also enable line numbers for hybrid numbers
set showmatch                   " show matching brackets/parenthesis
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches,
                                " then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set autoindent                  " indent at the same level of the previous line
set shiftwidth=2                " use indents of 2 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=2                   " an indentation every two columns
set softtabstop=2               " let backspace delete indent
set pastetoggle=<F2>            " F2 disables autoindent to paste
set showcmd                     " Shows multicharacter commands

set path+=**                    " Search in subfolders for tab completion
set wildmenu                    " Display all matching files in autocomplete

" switching between tabs
map <leader>a gt
map <leader>f gT

" Stupid shift key fixes    
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

" Up and down visually instead of per line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

autocmd BufNewFile,BufReadPre *.launch setf xml
autocmd BufNewFile,BufReadPre *.ino setf arduino

