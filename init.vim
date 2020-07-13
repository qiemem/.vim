if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

"""
" Visual
"""
Plug 'kshenoy/vim-signature' " Shows marks in gutter
Plug 'iCyMind/NeoSolarized'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim' " focused editing

"""
" Motion and editing
"""
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-lion' " gl<delim>, gL<delim>
Plug 'wellle/targets.vim'
Plug 'chrisbra/improvedft' " makes f and t move between lines

Plug 'qiemem/grepop'

"""
" Autocompletion
"""
Plug 'roxma/nvim-yarp'
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'c9s/vimomni.vim' " for viml
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

"""
" File management
"""
Plug 'scrooloose/nerdtree'
Plug 'bogado/file-line'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '-> fzf#install()' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/neomru.vim'


"""
" Random language support
"""
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'sheerun/vim-polyglot'

"""
" Formatting
"""
Plug 'tpope/vim-sleuth' " Autodetects indentation settings of file

""
" Integrations
"""
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator' " Allows moving to tmux panes
Plug 'codeindulgence/vim-tig'

"""
" Linting
"""
" Using COC for all linting purposes now

"""
" Python
"""
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

call plug#end()

filetype indent plugin on

if has("syntax")
    syntax on
endif

"source ~/.vim/bundle/tslime.vim/tslime.vim

let mapleader = " "
let maplocalleader = " "
"nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"set timeoutlen=100
set tags=./tags,tags;$HOME

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Makes files with long lines much, much faster
" Don't think this is needed anymore
"nnoremap <leader>ll :syntax off<cr>:syntax on<cr>

set clipboard+=unnamedplus

"""
" Window/Tmux navigation
"""

nnoremap <a-j> :TmuxNavigateDown<CR>
nnoremap <a-k> :TmuxNavigateUp<CR>
nnoremap <a-h> :TmuxNavigateLeft<CR>
nnoremap <a-l> :TmuxNavigateRight<CR>
vnoremap <a-j> <c-\><c-n>:TmuxNavigateDown<CR>
vnoremap <a-k> <c-\><c-n>:TmuxNavigateUp<CR>
vnoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<CR>
vnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<CR>
inoremap <a-j> <c-\><c-n>:TmuxNavigateDown<CR>
inoremap <a-k> <c-\><c-n>:TmuxNavigateUp<CR>
inoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<CR>
inoremap <a-l> <c-\><c-n>:TmuxNavigateRight<CR>
cnoremap <a-j> <c-\><c-n>:TmuxNavigateDown<CR>
cnoremap <a-k> <c-\><c-n>:TmuxNavigateUp<CR>
cnoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<CR>
cnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<CR>
if has('nvim')
    tnoremap <a-j> <c-\><c-n>:TmuxNavigateDown<CR>
    tnoremap <a-k> <c-\><c-n>:TmuxNavigateUp<CR>
    tnoremap <a-h> <c-\><c-n>:TmuxNavigateLeft<CR>
    tnoremap <a-l> <c-\><c-n>:TmuxNavigateRight<CR>
    "tnoremap <ESC><ESC> <C-\><C-n>G:call search(".", "b")<CR>$
endif

"""
" Use Mouse
"""
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode. This allows you to resize splits
    " with the mouse in xterm
    "set ttymouse=xterm2
endif

"""
" Buffer Behavior
"""
set hidden	"Abondaned buffers are hidden instead of destroyed
noremap <Leader>t :NERDTreeToggle<CR>
noremap <leader>bk :bp<bar>bd#<CR>


"""
" Status line
"""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""
" JS formatting
"""
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"""
" Autocomplete
"""
set wildmode=longest:full,full
" set wildmenu " Done by sensible
set wildignorecase

"set completeopt=longest,menuone,noselect,noinsert
set completeopt=menuone,noselect,noinsert
set wildignore+=*.so,*.swp,*.zip,*.class

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-python',
      \ 'coc-prettier',
      \ 'coc-css',
      \ 'coc-clangd',
      \]
" COC config
if filereadable($HOME . "/.config/nvim/cocrc.vim")
  source ~/.config/nvim/cocrc.vim
endif

"""
" Simple mappings
"""
nnoremap Y y$
nnoremap H ^
nnoremap L $

"""
" Indentation
"""
set shiftwidth=4
set tabstop=4
" set autoindent " done by sensible
set smartindent
set expandtab

autocmd FileType vim setlocal shiftwidth=2 tabstop=2

"""
" View
"""
set lazyredraw
set cursorline
"set laststatus=2 " Done by sensible
"set ruler " Done by sensible
set visualbell
"set showcmd " Done by sensible
set showmatch

"""
" Color
"""
set termguicolors
set background=dark
colorscheme NeoSolarized
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0


"""
" Encoding stuff
"""
" set fileformats=unix,mac,dos " Done by sensible

"""
" LaTeX
"""
"let g:tex_conceal = ""
"nnoremap <leader>lp :Latexmk<CR>
"let g:vimtex_imaps_enabled = 0
"let g:polyglot_disabled = ['latex']

"""
" Markdown
"""
let g:pandoc#syntax#conceal#use = 0

"""
" Fzf
"""

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.5, 'yoffset': 0.0 } }
let g:fzf_preview_window = 'up:50%'
let g:fzf_command_prefix = 'Fzf'

"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.2, 'style': 'minimal', 'anchor': 'S' } }
"
command! -bang -nargs=* FzfAllFiles
            \ call fzf#vim#grep(
            \   'rg --smart-case -l -uu -- ""', 0,
            \   fzf#vim#with_preview(), <bang>0)

nmap <Leader>f [fzf]
noremap <leader>/ :execute 'FzfRg ' . input('Rg/')<CR>
noremap <silent> <Leader><Leader> :FzfCommands<CR>
noremap <silent> [fzf]f :FzfFiles<CR>
noremap <silent> [fzf]b :FzfBuffer<CR>
noremap          [fzf]l :FzfRg<CR>
noremap <silent> [fzf]/ :FzfBLines<CR>
noremap <silent> [fzf]m :FzfMarks<CR>
noremap <silent> [fzf]r :FzfHistory<CR>
noremap <silent> [fzf]: :FzfHistory:<CR>
noremap <silent> [fzf]a :FzfAllFiles<CR>
noremap <silent> [fzf]g :FzfGFiles<CR>
noremap <silent> [fzf]t :FzfTags<CR>
noremap <silent> [fzf]j :FzfBTags<CR>

nmap <Leader>c [coc]
noremap <silent> [coc] :CocFzfList<CR>
noremap <silent> [coc]c :CocFzfList commands<CR>
noremap <silent> [coc]a :CocFzfList actions<CR>
noremap <silent> [coc]a :CocFzfList actions<CR>
xnoremap <silent> [coc]a :CocFzfList actions<CR>

imap <C-x><C-l> <plug>(fzf-complete-line)

"""
" Searching
"""
"set grepprg=rg\ --no-heading\ --column\ --line-number\ --color=never
set grepprg=ag\ --nogroup
" nnoremap <leader>g :set operatorfunc=GrepOperator<CR>g@
" vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>
" set incsearch " Done by sensible
set ignorecase
set smartcase

"""
" Substition
"""
if has('nvim')
  set inccommand=split
endif

"""
" git
"""

"command! Tig tabedit term://tig | startinsert

"""
" NetLogo
"""
au! BufRead,BufNewFile *.nlogo setfiletype nlogo

"""
" Code Folding
"""
set foldmethod=syntax
set foldlevelstart=99

"""
" Undo and swap
"""
set undofile
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//
nnoremap <leader>u :UndotreeToggle<CR>

"""
" Syntax checking
"""

" This is done by COC now

"""
" Focusing
"""

let g:goyo_linenr=1

"""
" Python
"""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

nnoremap <leader>pr :IPythonCellExecuteCellVerboseJump<CR>
