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
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-pyclang'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""
" File management
"""
Plug 'scrooloose/nerdtree'
Plug 'bogado/file-line'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'laher/fuzzymenu.vim'
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
Plug 'dense-analysis/ale'

"""
" Python
"""
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'psf/black', { 'for': 'python', 'tag': '*' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'HansPinckaers/ncm2-jedi', { 'for': 'python' }
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
" Autocomplete
"""
set wildmode=longest:full,full
" set wildmenu " Done by sensible
set wildignorecase

"set completeopt=longest,menuone,noselect,noinsert
set completeopt=menuone,noselect,noinsert
set wildignore+=*.so,*.swp,*.zip,*.class

call coc#add_extension('coc-json', 'coc-tsserver', 'coc-python')

"let g:completor_python_binary = '/usr/local/bin/python3'
"
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set shortmess+=c
"inoremap <c-c> <ESC>
"" make it fast
"let ncm2#popup_delay = 5
"let ncm2#complete_length = [[1, 1]]

"""
" Quickfix
"""

let g:ale_linters = {
\   'pandoc': ['proselint'],
\   'cpp': ['clang'],
\}
"autocmd BufEnter *.cpp,*.h,*.hpp,*.hxx let g:ale_cpp_clang_options = join(ncm_clang#compilation_info()['args'], ' ')
let g:ncm2_pyclang#library_path='/usr/lib64/libclang.so.9'


let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

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
" Jumping
"""

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=* BTags call fzf#vim#buffer_tags(<q-args>, {'options': '--no-sort'}, <bang>0)
command! -bang -nargs=* Tags call fzf#vim#buffer_tags(<q-args>, {'options': '--no-sort'}, <bang>0)

function! MyFZF(options)
    call fzf#run(extend({'down': '40%', 'options': '-m', 'sink': 'e'}, a:options, 'force'))
endfunction

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

noremap <leader>ff :FzfPreviewProjectFiles<CR>
noremap <leader>fb :FzfPreviewBuffers<CR>
"noremap <leader>/ :execute 'Rg ' . input('Rg/')<CR>
noremap <leader>/ :FzfPreviewProjectGrep . input('Grep/')<CR>
noremap <leader>fl :FzfPreviewProjectGrep '.*'<CR>
noremap <leader>f/ :BLines<CR>
noremap <leader>fm :Marks<CR>
noremap <leader>fr :FzfPreviewMruFiles<CR>
noremap <leader>fe :FzfPreviewProjectMruFiles<CR>
noremap <leader>f: :History:<CR>
noremap <leader>fc :Commands<CR>
noremap <leader>fa :call MyFZF({'source': 'rg -u -l'})<CR>
noremap <leader>fg :FzfPreviewGitFiles<CR>
noremap <leader>ft :Tags<CR>
noremap <leader>fj :BTags<CR>

if &rtp =~ 'fuzzymenu.vim'
  if &rtp =~ 'fzf-preview.vim'
    call fuzzymenu#Add('Open project file (preview)', {'exec': 'FzfPreviewProjectFiles'})
    call fuzzymenu#Add('Buffers (preview)', {'exec': 'FzfPreviewBuffers'})
    call fuzzymenu#Add('Interactive grep in project (preview)', {'exec': 'FzfPreviewProjectGrep ".*"', 'after': 'call fuzzymenu#InsertMode()'})
    call fuzzymenu#Add('Grep in project (preview)', {'exec': 'FzfPreviewProjectGrep . input("Grep/")', 'after': 'call fuzzymenu#InsertMode()'})
  endif
endif

imap <C-x><C-l> <plug>(fzf-complete-line)

set wildignore+=*.swp,*/target/*

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

nnoremap <leader>an :ALENextWrap<CR>
nnoremap <leader>ap :ALEPreviousWrap<CR>

"""
" Focusing
"""

let g:goyo_linenr=1

"""
" Python
"""
let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:slime_target = "tmux"


