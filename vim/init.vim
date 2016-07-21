" Managing plugins using vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'raimondi/delimitmate'
Plug 'severin-lemaignan/vim-minimap'
Plug 'takac/vim-hardtime'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline-themes'
Plug 'matze/vim-move'
Plug 'eugen0329/vim-esearch'
Plug 'rakr/vim-two-firewatch'
Plug 'roosta/srcery'
Plug 'tmhedberg/SimpylFold'
Plug 'terryma/vim-expand-region'
Plug 'wellle/targets.vim'
Plug 'plasticboy/vim-markdown'
"Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown'
"Plug 'jtratner/vim-flavored-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'christoomey/vim-system-copy' "Install xsel
Plug 'luochen1990/rainbow'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
"Plug 'christoomey/vim-tmux-navigator'
" rman/golden-ratio.git
call plug#end()

set number
"set numberwidth=3
" Relative line numbering
syntax enable
colorscheme srcery
let g:srcery_italic=1
highlight Comment cterm=italic
"colorscheme two-firewatch
"let g:two_firewatch_italics=1
set background=dark
" set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set copyindent
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set magic
set backspace=indent,eol,start
filetype plugin on
filetype plugin indent on
autocmd filetype python set expandtab
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set hidden

" Change the mapleader to \ (default)
let mapleader="\<SPACE>"
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
autocmd filetype html,xml set listchars-=tab:>.
set pastetoggle=<F2>
nnoremap ; :
" Unmapping the arrow keys
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
" Remapping the movement
nnoremap j gj
nnoremap k gk
nmap <silent> ,/ :nohlsearch<CR>
" Easy window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Nerditya neovim setup
set showcmd
set showmode
set ruler
set formatoptions+=o
set modeline
set nojoinspaces
" More natural splits
set splitbelow
set splitright
" Toggle between normal and relative numbering
nnoremap <leader>r :call NumberToggle()<CR>

" Airline
set laststatus=2
" set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = '> '
let g:airline#extensions#tabline#right_alt_sep = '>'
"let g:airline_left_sep = ' '
"let g:airline_left_alt_sep = '>'
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = '>'
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enale_smart_case = 1
" Let TAB also do autocompletion
inoremap <silent><expr> <Tab>
		\ pumvisible() ? "\<C-n>" : deoplete#manual_complete()

" Neomake Settings
autocmd! BufWritePost * Neomake

" Git gutter settings
set updatetime=1000

" fzf settings
" Remapping 
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Open file menu
nnoremap <Leader>o :Files<CR>
" Open buffer menu
nnoremap <Leader>b :Buffers<CR>
" Open most recently used files
nnoremap <Leader>f :History<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" vim-esearch settings
let g:esearch = {
    \ 'adapter': 'ag',
    \ 'backend': 'nvim',
    \ 'out': 'win',
    \ 'batch_size': 1000,
    \ 'use': ['visual', 'hlsearch', 'last'],
    \}
" Vim-move customization
let g:move_key_modifier = 'C-S'

" Automatically start nerdtree
"autocmd vimenter * NERDTree
map <C-\> :NERDTreeToggle<CR>
" Automatically close NERDTree if it's the last window there
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeHijackNetrw = 1

" Remapping buffer navigation
" Move to next tab
nmap <leader>] :bnext<CR>
" Move to previous buffer
nmap <leader>[ :bprevious<CR>

" Enabling Hardmode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:hardtime_default_on = 1

" Tagbar toggle
nmap <F8> :TagbarToggle<CR>

" Minimap Highlight
let g:minimap_highlight='Visual'

"" Indent Guide
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme brogrammer :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme brogrammer :hi IndentGuidesEven guibg=green ctermbg=4

" Colbycheeze settings
" Autoload files
set autoread
au FocusGained,BufEnter * :silent! !
set visualbell
set cursorline
"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
"autocmd FocusLost * call ToggleRelativeOn()
"autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()
" Make it obvious where 100 characters is
set textwidth=0
" set formatoptions=cq
set formatoptions=qrn1
set wrap linebreak nolist
set wrapmargin=80
"set colorcolumn=+1
" Remapping the Esc key
:imap jk <Esc>
" Map Leader S to save
map <leader>s :w<CR>
" Quickly close windows
nnoremap <leader>x :x<cr>
" Quickly quit window
nnoremap <leader>q :q!<cr>

" A good vimrc
set foldenable " Enables folding
set foldlevelstart=10 "Folds below level 10 will be folded
set foldnestmax=10 "More than 10 folds can't be nested
set foldmethod=indent 

" Gundo-vim mapping
nnoremap <F5> :GundoToggle<CR>

" Indent line settings
let g:indentLine_char = '┆'
let g:indentLine_color_gui = '#A4E57E'

" Resizing using arrow keys
nnoremap <left> :vertical resize +5<cr> 
nnoremap <right> :vertical resize -5<cr>
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>

" Highlighting when col >= 80
let &colorcolumn=join(range(81,999),",")

"" New <space> and <backspace> mapppings
"nnoremap <space> 10jzz
"nnoremap <backspace> 10kzz

" Simply fold settings
let g:SimpylFold_docstring_preview = 1

" Limelight Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Vim pencil settings
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
augroup END
let g:pencil#wrapModeDefault = 'soft'

" vim markdown settings
let g:vim_markdown_math=1

" Instant markdown settings
let g:instant_markdown_autostart = 0

" vim flavored markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"Syntax highlighting in Markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['bash=sh', 'css', 'django', 'handlebars', 'javascript', 'js=javascript', 'json=javascript', 'perl', 'php', 'python', 'ruby', 'sass', 'xml', 'html']

" Overriding vim italics codes
"  must be entered with <C-V><Esc>
set t_ZH=[3m
set t_ZR=[23m

" Rainbow parentheses
let g:rainbow_active=1

" vim-notes settings
let g:notes_directories=['~/Dropbox/Notes']
let g:notes_suffix='.note'
let g:notes_tab_indents=0
let g:notes_conceal_code=0
let g:notes_conceal_italic=0
let g:notes_conceal_bold=0
let g:notes_conceal_url=0
