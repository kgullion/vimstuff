set t_Co=8

set nocompatible
let mapleader=","

"pep8
let g:pep8_map='<leader>8'
let g:pep8_map='<leader>*'

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <leader>- 10<c-w>-
map <leader>+ 10<c-w>+
map <leader>= 10<c-w>+

" set window size on focus
set winheight=10
set winwidth=80

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Run command-t file search
map <leader>f :CommandTFlush<CR>:CommandT<CR>
map <leader>t :CommandT<CR>
map <leader>b :CommandTBuffer<CR>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
"filetype off
"call pathogen#runtime_append_all_bundles("~/.vim/bundle")
"call pathogen#helptags()

call pathogen#infect("~/.vim/bundle")

" ==========================================================
" Arpeggio - Allows chorded key mapping
" ==========================================================
call arpeggio#load()
Arpeggio inoremap () ()<Left>
Arpeggio inoremap j( ()<Left>
Arpeggio inoremap [] []<Left>
Arpeggio inoremap j[ []<Left>
Arpeggio inoremap {} {}<Left>
Arpeggio inoremap J{ {}<Left>
Arpeggio inoremap <> <><Left>
Arpeggio inoremap J< <><Left>
Arpeggio inoremap j' ''<Left>
Arpeggio inoremap n' '',<Left><Left>
Arpeggio inoremap J" ""<Left>
Arpeggio inoremap N" "",<Left><Left>
Arpeggio inoremap n( (),<Left><Left>
Arpeggio inoremap J_ __<Left>
Arpeggio inoremap ^$ ^$<Left>
" <c-o>vbobed will cut word under cursor from begin to end
Arpeggio inoremap pc <c-o>vbobedclass <c-o>p():<Left><Left>
Arpeggio inoremap pd <c-o>vbobeddef <c-o>p():<Left><Left>
Arpeggio inoremap pf <c-o>vbobeddef <c-o>p():<Left><Left>
Arpeggio inoremap dm <c-o>vbobedclass <c-o>p(models.Model):<CR>
Arpeggio inoremap dt {%  %}<Left><Left><Left>
Arpeggio inoremap dv {{  }}<Left><Left><Left>
Arpeggio inoremap dg {<>}<Left><Left>
Arpeggio inoremap jk <Right>
Arpeggio inoremap hj <Left>
Arpeggio inoremap df <Esc>
Arpeggio noremap f# I#<Esc>

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"colorscheme torte
"colorscheme desert

"set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized

colorscheme jellybeans

" Paste from clipboard
map <leader>p "+p

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
"
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

let g:acp_completeoptPreview=1

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUALENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

set colorcolumn=79
