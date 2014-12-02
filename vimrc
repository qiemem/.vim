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
Plug 'tpope/vim-fugitive'
Plug 'leshill/vim-json'
Plug 'walm/jshint.vim'
Plug 'leafgarland/typescript-vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'junegunn/vim-easy-align'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
"Plug 'fholgado/minibufexpl.vim'
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
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'

call plug#end()

filetype indent plugin on

if has("syntax")
    syntax on
endif

source ~/.vim/bundle/tslime.vim/tslime.vim

let mapleader = " "
set tags=./tags,tags;$HOME

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

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
" Status line
"""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""
" Autocomplete
"""
set wildmode=longest:full,full
" set wildmenu " Done by sensible
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview
set wildignore+=*.so,*.swp,*.zip,*.class

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
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

"""
" View
"""
set number
set cursorline
set cursorcolumn
set laststatus=2 " Done by sensible
set ruler " Done by sensible
set visualbell
set showcmd " Done by sensible
set showmatch
set guifont=Monaco:h10

"""
" Color
"""
set background=dark
colorscheme solarized

" At some point, solarized set this to grey. This looks terrible with both
" gitgutter and signify.
highlight SignColumn ctermbg=NONE guibg=NONE

"""
" Encoding stuff
"""
" set fileformats=unix,mac,dos " Done by sensible

"""
" LaTeX
"""
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode "$*"'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode "$*"'
let g:LatexBox_viewer = "open -a Skim"
let g:LatexBox_latexmk_async = 1

"""
" File Searching
"""
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
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :ccl<CR>:Ag<SPACE>''<Left>
" set incsearch " Done by sensible
set ignorecase
set smartcase

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

"""
" Undo and swap
"""
set undofile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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

"""
" tmux
"""
let g:VimuxOrientation = "h"
let g:VimuxPromptString = ">>> "
let g:VimuxHeight = "30"

function! VimuxOperator(type)
    let saved_register = @@
    if a:type == 'v'
        normal! `<v`>y
    elseif a:type ==# 'char' || a:type ==# 'line'
        normal! `[v`]y
    else
        echo a:type
        return
    endif

    call VimuxSendText(@@)

    if @@[strlen(@@) - 1] != "\n" && @@[strlen(@@) - 1] != "\r"
        call VimuxSendKeys("Enter")
    endif

    let @@ = saved_register
endfunction

nnoremap <Leader>tt :set operatorfunc=VimuxOperator<CR>g@
vnoremap <Leader>tt :<C-U>call VimuxOperator(visualmode())<CR>

noremap <Leader>tp :VimuxPromptCommand<CR>
noremap <Leader>tl :VimuxRunLastCommand<CR>

noremap <Leader>ts :call VimuxRunCommand("sbt")<CR>
noremap <Leader>tsc :call VimuxRunCommand("compile")<CR>
noremap <Leader>tsp :call VimuxRunCommand("package")<CR>
noremap <Leader>tst :call VimuxRunCommand("test")<CR>

noremap <Leader>ti :call VimuxRunCommand("ipython")<CR>
