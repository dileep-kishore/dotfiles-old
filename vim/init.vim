" Managing plugins using vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " File browser
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' } " Highlighting for NERDTree
Plug 'tpope/vim-fugitive'                 " Git wrapper
Plug 'junegunn/gv.vim'                    " A git commit browser
Plug 'w0rp/ale'                           " Async linting engine
Plug 'tpope/vim-surround'                 " Surround text objects
Plug 'tpope/vim-abolish'                  " Makes working with variants of a word easier
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fzf plugin
Plug 'junegunn/fzf.vim'                   " fzf buffer
Plug 'bling/vim-airline'                  " Vim status bar
Plug 'tpope/vim-commentary'               " Key bindings for commenting
Plug 'ludovicchabant/vim-gutentags'       " Automatic tag management
Plug 'majutsushi/tagbar'                  " Ctags bar for exploring symbols
Plug 'airblade/vim-gitgutter'             " Git diffs in gutter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autcompletion
Plug 'zchee/deoplete-jedi', { 'for': 'python' } " autocompletion for python
Plug 'junegunn/vim-easy-align'            " Align text
Plug 'sjl/gundo.vim'                      " Undo tree
Plug 'terryma/vim-multiple-cursors'       " Multiple cursor support
Plug 'Yggdroot/indentLine'                " Shows indent guides on screen
Plug 'raimondi/delimitmate'               " Insert mode autocompletion for delimiters
Plug 'takac/vim-hardtime'                 " Makes it harder to use arrows and hjkl
Plug 'thinca/vim-quickrun'                " Execute part of file
Plug 'tpope/vim-repeat'                   " Supports repeat of complex motions
Plug 'junegunn/vim-peekaboo'              " Peek into registers
Plug 'vim-airline/vim-airline-themes'     " Collection of airline themes
Plug 'matze/vim-move'                     " Move visually selected lines
Plug 'eugen0329/vim-esearch'              " Search all files in project for keyword
Plug 'tmhedberg/SimpylFold'               " Better python code folding
Plug 'terryma/vim-expand-region'          " Expand selected region
Plug 'wellle/targets.vim'                 " Supports more text-objects
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " Markdown support for vim
Plug 'junegunn/goyo.vim'                  " Distraction-free writing in vim
Plug 'junegunn/limelight.vim'             " Hyperfocus-writing in vim
Plug 'christoomey/vim-system-copy'        " Support system copy-paste (Install xsel)
Plug 'luochen1990/rainbow'                " Rainbow paranthesis
Plug 'SirVer/ultisnips'                   " Plugin for snippets
Plug 'honza/vim-snippets'                 " More snippets
Plug 'sickill/vim-pasta'                  " Paste preserves indentation
Plug 'mhinz/vim-startify'                 " Show start-page when you open nvim
Plug 'sheerun/vim-polyglot'               " Multiple language syntax support
Plug 'michaeljsmith/vim-indent-object'    " Defines indent as text object
Plug 'mattn/emmet-vim'                    " Emmet support for vim
Plug 'justinmk/vim-sneak'                 " Sneak for vim
Plug 'tpope/vim-rhubarb'                  " Remote source control support
Plug 'tpope/vim-dispatch'                 " Async builder
Plug 'janko-m/vim-test'                   " Makes testing easier
Plug 'Wakatime/vim-wakatime'              " Wakatime
Plug 'edkolev/tmuxline.vim'               " Tmux line sync with airline
Plug 'tmux-plugins/vim-tmux-focus-events' " Restore focus autocommands in tmux session
Plug 'christoomey/vim-tmux-navigator'     " Seamless navigation between vim and tmux
Plug 'chrisbra/Colorizer'                 " Highlight colors in vim
Plug 'KabbAmine/zeavim.vim'               " Search zeal docs from vim
Plug 'machakann/vim-highlightedyank'      " Highlights yanked text briefly
Plug 'tpope/vim-obsession'                " continuously update sessions (wrapper around :mksession)
Plug 'tpope/vim-unimpaired'               " Useful `[` and `]` mappings
Plug 'wesQ3/vim-windowswap'               " Swap two windows easily
Plug 'wincent/loupe'                      " Enhances vim's `search-commands`
Plug 'kshenoy/vim-signature'              " Plugin to display marks
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' } " Language client support
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] } " Wrapper around multiple grep tools
Plug 'editorconfig/editorconfig-vim'      " Support for editorconfig
Plug 'vimwiki/vimwiki', { 'branch': 'dev' } " Notes plugin for vim
Plug 'ryanoasis/vim-devicons'             " Icon support

" Themes
Plug 'roosta/srcery'
Plug 'joshdick/onedark.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'dylanaraps/wal.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
call plug#end()

set encoding=utf-8
set number
"set numberwidth=3
" Relative line numbering
syntax enable
set background=dark
colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
set termguicolors
highlight Comment cterm=italic
highlight Comment gui=italic
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
filetype plugin indent on
"autocmd filetype python set expandtab
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set hidden

" Change the mapleader to \ (default)
let mapleader="\<SPACE>"
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:→\
set list
autocmd filetype html,xml set listchars-=tab:>.
set pastetoggle=<F2>
" Unmapping the arrow keys
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
" " Remapping the movement
" nnoremap j gj
" nnoremap k gk
nmap <silent> <leader>/ :nohlsearch<CR>
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
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = '>'
" let g:airline#extensions#tabline#left_alt_sep = '>'
" let g:airline#extensions#tabline#right_sep = '>'
" let g:airline#extensions#tabline#right_alt_sep = '>'
"let g:airline_left_sep = ' '
"let g:airline_left_alt_sep = '>'
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = '>'
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext' " old: base16_google
let g:airline#extensions#obsession#enabled = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
" Let TAB also do autocompletion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" set sources
call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
let g:deoplete#sources = {}
let g:deoplete#sources.gitcommit = ['github']
let g:deoplete#sources.cpp = ['LanguageClient']
let g:deoplete#sources.rust = ['LanguageClient']
let g:deoplete#sources.c = ['LanguageClient']
let g:deoplete#sources.javascript = ['LanguageClient']
let g:deoplete#sources.vim = ['around', 'buffer', 'member', 'file', 'ultisnips']
" deoplete close preview on completion
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
" deoplete-jedi configurations
let g:deoplete#sources#jedi#server_timeout = 20
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#worker_threads = 2
" virtual environment setting for deoplete-jedi
let g:python_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'


" ale settings
let g:ale_sign_info = "\uf05a"
let g:ale_sign_error = "✘"
let g:ale_sign_warning = "\uf071"
let g:ale_sign_style_error = "\ue009"
let g:ale_sign_style_warning = "⚑"
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['stylelint', 'eslint'],
\   'python': ['pylint', 'mypy', 'flake8'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'python': ['autopep8', 'black'],
\}
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_python_mypy_options = '--ignore-missing-imports'

" Git gutter settings
set updatetime=200

" fzf settings
" Remapping
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Search git ls-files
nnoremap <Leader>o :GFiles<CR>
" Search all files
nnoremap <Leader>ff :Files<CR>
" Search recently used files
nnoremap <Leader>fh :History<CR>
" Search open buffers
nnoremap <Leader>fb :Buffers<CR>
" Search open windows
nnoremap <Leader>fw :Windows<CR>
" Search tags in buffer
nnoremap <Leader>ft :Tags<CR>
" Search commits
nnoremap <Leader>fc :Commits<CR>
" Search lines
nnoremap <Leader>fl :Lines<CR>
" Search using Ag
nnoremap <Leader>fs :Ag<CR>
" Search marks
nnoremap <Leader>fm :Marks<CR>

" vim-esearch settings
let g:esearch = {
    \ 'adapter': 'ag',
    \ 'backend': 'nvim',
    \ 'out': 'win',
    \ 'batch_size': 1000,
    \ 'use': ['visual', 'hlsearch', 'last', 'word_under_cursor'],
    \}
" Start esearch prompt autofilled with one of g:esearch.use initial patterns
call esearch#map('<leader>ef', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<leader>ew', 'esearch-word-under-cursor')

" Automatically start nerdtree
"autocmd vimenter * NERDTree
" Automatically close NERDTree if it's the last window there
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeHijackNetrw = 1

" Enabling Hardmode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:hardtime_default_on = 1

" Tagbar toggle
nmap <F8> :TagbarToggle<CR>

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
set wrap linebreak "nolist
"set wrapmargin=80
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
let g:indentLine_setColors = 0
let g:indentLine_char = '⎸'
" let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_concealcursor = 'nc'
let g:indentLine_conceallevel = 2

" Resizing using arrow keys
nnoremap <left> :vertical resize +5<cr>
nnoremap <right> :vertical resize -5<cr>
nnoremap <up> :resize +5<cr>
nnoremap <down> :resize -5<cr>

" Highlighting when col >= 80
" let &colorcolumn=join(range(81,999),",")

" Simply fold settings
let g:SimpylFold_docstring_preview = 1

" Limelight Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:goyo_linenr=1

" Overriding vim italics codes
"  must be entered with <C-V><Esc>
set t_ZH=[3m
set t_ZR=[23m

" Rainbow parentheses
let g:rainbow_active = 1

" Ultisnippet settings
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsSnippetsDir = "~/.config/nvim/custom_snippets"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'custom_snippets']
let g:UltiSnipsUsePythonVersion = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Narrow ag results in vim using fzf
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

" Vim expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Tmuxline settings
" let g:tmuxline_preset = 'full'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W #F'],
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#obsession#indicator_text = "\uf692"

" Setting syntax coloring for nextflow files
augroup filetypedetect
    au BufRead,BufNewFile *.nf set filetype=groovy
augroup END

" Setting syntax coloring for coconut files
augroup filetypedetect
    au BufRead,BufNewFile *.coco set filetype=python
augroup END

" Setting syntax coloring for jsx files
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" Grepper configuration
nnoremap <leader>r :Grepper -tool git<cr>
nnoremap <leader>R :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Optional. The default behaviour should work for most users.
let g:grepper               = {}
let g:grepper.tools         = ['git', 'ag', 'rg']
let g:grepper.jump          = 0
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 0
let g:grepper.quickfix      = 0

" LanguageClient Configuration
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Git fugitive configuration

nnoremap <leader>gc :Gcommit --verbose<CR>
vnoremap <leader>gs :diffput<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>

" Setting for vim-test
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
" test to be used for python
let test#python#runner = 'pytest'

" Live view of subsitutions
set inccommand=split

" Use sytem clipboard
" set clipboard+=unnamedplus

" Make highlighted text more visible
" hi HighlightedyankRegion cterm=reverse gui=reverse

" show break character at the beginning of wrapped lines
set showbreak=↪\ 

" Loupe settings
let g:LoupeClearHighlightMap = 1

" EasyAlign keymaps
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Setting up keyword highlighting in comments
autocmd Syntax * syntax keyword Todo NOTE containedin=.*Comment
autocmd Syntax * syntax keyword Todo HACK containedin=.*Comment
autocmd Syntax * syntax keyword Todo QUESTION containedin=.*Comment

" Editing vim-startify lists
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': [   'Sessions']       },
  \ { 'type': 'files',     'header': [   'MRU']            },
  \ { 'type': 'dir',       'header': [   'MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': [   'Bookmarks']      },
  \ { 'type': 'commands',  'header': [   'Commands']       },
  \ ]

" Prepend icon to startify entries
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

"   :Ag  - Start fzf with hidden preview window that can be enabled with '?' key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? GFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" Sessions search using fzf.vim
function! s:sessions()
  call fzf#run({
  \ 'source':  'ls -1 ~/.vim/session',
  \ 'sink':    'SLoad',
  \ 'options': '+m --prompt="Sessions> "',
  \ 'down':    '40%'
  \})
endfunction
command! Sessions call s:sessions()
" Load saved sessions
nnoremap <Leader>p :Sessions<CR>

" Editorconfig plugin configuration
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'

" Edit last register (useful for macros)
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Remove cursorline on inactive window
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" Vim-sneak configuration
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Vim-markdown configuration
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" General conceal
set concealcursor=nc

" Multiple cursor configuration
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" Vim-wiki configuration
let g:vimwiki_dir_link = 'index'
let g:vimwiki_table_mappings = 0 " needed for deoplete completion using tab
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_listsyms = ' .'
let g:vimwiki_listsym_rejected = ''

let wiki_personal = {}
let wiki_personal.path = '/home/dileep/Documents/Notes/personal'
let wiki_personal.syntax = 'markdown'
let wiki_personal.html_path = '/home/dileep/Documents/Notes/personal/exports'

let wiki_work = {}
let wiki_work.path = '/home/dileep/Documents/Notes/work'
let wiki_work.syntax = 'markdown'
let wiki_work.html_path = '/home/dileep/Documents/Notes/work/exports'

let g:vimwiki_list = [
\    wiki_work,
\    wiki_personal,
\]

" Vim-windowswap configuration
let g:windowswap_map_keys = 0
nnoremap <silent> <Leader>yw :call WindowSwap#EasyWindowSwap()<CR>
