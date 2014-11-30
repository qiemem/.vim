set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

Plug 'kchmck/vim-coffee-script'
Plug 'qiemem/tslime.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'gre/play2vim'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'leshill/vim-json'
Plug 'walm/jshint.vim'
Plug 'leafgarland/typescript-vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'junegunn/vim-easy-align'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-lion'
Plug 'wellle/targets.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
Plug 'qiemem/grepop'
Plug 'tacahiroy/ctrlp-funky'
Plug 'bufkill.vim'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

filetype indent plugin on

if has("syntax")
	syntax on
endif

source ~/.vim/bundle/tslime.vim/tslime.vim

let mapleader = ","
set tags=./tags,tags;$HOME
"""
" Use Mouse
"""
set mouse=a

"""
" Buffer Behavior
"""
set hidden	"Abondaned buffers are hidden instead of destroyed
noremap <Leader>b :MBEToggle<CR>
noremap <Leader>t :NERDTreeToggle<CR>

"""
" Autocomplete
"""
set wildmode=longest:full,full
" set wildmenu " Done by sensible
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview
set wildignore+=*.so,*.swp,*.zip,*.class

"let g:neocomplete#enable_at_startup = 1
""let g:neocomplete#auto_completion_start_length = 0
"if !exists('g:neocomplete#force_omni_input_patterns')
"	let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.lisp = '[^\(\)\s]'
"
"inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-l>   neocomplete#complete_common_string()
"inoremap <expr><C-y>   neocomplete#close_popup()
"inoremap <expr><C-e>   neocomplete#cancel_popup()
"inoremap <expr><C-y>   neocomplete#close_popup()
"
"autocmd FileType lisp setlocal omnifunc=SlimvOmniComplete

"""
" Preview window
"""
autocmd cursormovedi * if pumvisible() == 0|pclose|endif " close if cursor moves
autocmd insertleave * if pumvisible() == 0|pclose|endif " close on leave insert

"""
" Simple mappings
"""
nnoremap Y y$


"""
" Indentation
"""
set shiftwidth=4
set tabstop=4
" set autoindent " done by sensible
set smartindent
set expandtab

"""
" Align
"""
"vnoremap <silent> <Enter> :EasyAlign<Enter>
"let g:easy_align_delimiters = {
"\ '"': { 'pattern': '"' },
"\ '+': { 'pattern': '[+\-\*/]' }
"\ }
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

"""
" View
"""
set number
set cursorline
set cursorcolumn
" set laststatus=2 " Done by sensible
" set ruler " Done by sensible
set visualbell
" set showcmd " Done by sensible
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
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"""
" Encoding stuff
"""
" set fileformats=unix,mac,dos " Done by sensible

"""
" LaTeX
"""
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
"let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode "$*"'
"let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode "$*"'
let g:LatexBox_viewer = "open -a Skim"
let g:LatexBox_latexmk_async = 1

"""
" File Searching
"""
"let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_map = '<leader>ff'
noremap <leader>fb :CtrlPBuffer<CR>
noremap <leader>fr :CtrlPMRU<CR>
noremap <leader>ff :CtrlP<CR>
noremap <leader>fa :CtrlPMixed<CR>
noremap <leader>fq :ccl<CR>:CtrlPQuickfix<CR>
noremap <leader>fd :CtrlPFunky<CR>


set wildignore+=*.swp,*/target/*

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough we don't need to cache
let g:ctrlp_use_caching = 0

"""
" Searching
"""
set grepprg=ag\ --nogroup
nnoremap <leader>g :set operatorfunc=GrepOperator<CR>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>
"map <Leader>g :grep -r --include='*.<C-R>=expand('%:e')<CR>' '<C-R><C-W>' ./<CR><CR>:cw<CR>
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :ccl<CR>:Ag<SPACE>''<Left>
" map <Leader>g :ccl<CR>:Ag<SPACE>'<C-R><C-W>'<CR>
" set incsearch " Done by sensible
set ignorecase
set smartcase

function! AgCtrlP(pattern)
    redir => results
    silent grep pattern
    redir END
    "echo string(split(results))
endfunction

function! AgCallback(selected_value) range
	echo "You selected: " . a:selected_value
endfunction
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

