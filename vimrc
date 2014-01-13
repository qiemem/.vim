set nocompatible

"""
" Vundle plugin management
"""
" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Other rtp manipulations
set rtp+=$GOROOT/misc/vim

"""
" BEGIN: Plugins
"""
Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
"Bundle 'bufkill'
Bundle 'qiemem/tslime.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gre/play2vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'davidhalter/jedi-vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'rking/ag.vim'
Bundle 'leshill/vim-json'
Bundle 'walm/jshint.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'kovisoft/slimv'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'matchit.zip'
Bundle 'junegunn/vim-easy-align'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vimwiki/vimwiki'

"""
" END: Plugins
"""

if has("autocmd")
	filetype indent plugin on
endif

if has("syntax")
	syntax on
endif

source ~/.vim/bundle/tslime.vim/tslime.vim

"""
" Use Mouse
"""
set mouse=a

"""
" Buffer Bahvior
"""
set hidden	"Abondaned buffers are hidden instead of destroyed
noremap <Leader>b :MBEToggle<CR>
noremap <Leader>t :NERDTreeToggle<CR>

"""
" Autocomplete
"""
set wildmode=longest:full,full
set wildmenu
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview
set wildignore+=*.so,*.swp,*.zip,*.class

let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#auto_completion_start_length = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.lisp = '[^\(\)\s]'

inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-l>   neocomplete#complete_common_string()
inoremap <expr><C-y>   neocomplete#close_popup()
inoremap <expr><C-e>   neocomplete#cancel_popup()
inoremap <expr><C-y>   neocomplete#close_popup()

autocmd FileType lisp setlocal omnifunc=SlimvOmniComplete

"""
" Preview window
"""
autocmd cursormovedi * if pumvisible() == 0|pclose|endif " close if cursor moves
autocmd insertleave * if pumvisible() == 0|pclose|endif " close on leave insert

"""
" Searching
"""
"map <Leader>g :grep -r --include='*.<C-R>=expand('%:e')<CR>' '<C-R><C-W>' ./<CR><CR>:cw<CR>
map <Leader>g :Ag! <C-R><C-W><CR>

"""
" Indentation
"""
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

"""
" Align
"""
vnoremap <silent> <Enter> :EasyAlign<Enter>
let g:easy_align_delimiters = {
\ '"': { 'pattern': '"' },
\ '+': { 'pattern': '[+\-\*/]' }
\ }

"""
" View
"""
set number
set cursorline
set cursorcolumn
set laststatus=2
set ruler
set visualbell
set showcmd
set showmatch
set guifont=Monaco:h10

"""
" Color
"""
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
highlight CursorLine guibg=#003C45
highlight CursorColumn guibg=#003C45

"""
" Encoding stuff
"""
set fileformats=unix,mac,dos

"""
" Search
"""
set incsearch
set ignorecase
set smartcase

"""
" LaTeX
"""
set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode "$*"'
"let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode "$*"'
let g:LatexBox_viewer = "open -a Skim"
let g:LatexBox_latexmk_async = 1

"""
" File Searching
"""
let g:ctrlp_cmd = 'CtrlPMixed'

"""
" NetLogo
"""
au! BufRead,BufNewFile *.nlogo setfiletype nlogo

"""
" Code Folding
"""
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=99
"
"let javaScript_fold    = 1         " JavaScript
"let perl_fold          = 1               " Perl
"let php_folding        = 1             " PHP
"let r_syntax_folding   = 1        " R
"let ruby_fold          = 1               " Ruby
"let sh_fold_enabled    = 1         " sh
"let vimsyn_folding     = 'af'       " Vim script
"let xml_syntax_folding = 1      " XML

"""
" Persistent Undo
"""
set undofile

"""
" SLIMV
"""
let g:lisp_rainbow=1
let g:slimv_simple_compl=1
" Using delimMate for this since this appears to be incompatible with NeoComplete
let g:paredit_mode=0 

"""
" Vimwiki
"""
let g:vimwiki_list = [{'path': '~/Dropbox/notes/',
			\ 'path_html': '~/Dropbox/notes_html/'}]

