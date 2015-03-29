if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

Plug 'kchmck/vim-coffee-script'
"Plug 'qiemem/tslime.vim'
Plug 'qiemem/vim-colors-solarized'
Plug 'gre/play2vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'leshill/vim-json'
Plug 'walm/jshint.vim'
Plug 'leafgarland/typescript-vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'junegunn/vim-easy-align'
Plug 'Valloric/YouCompleteMe'
Plug 'c9s/vimomni.vim'
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
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
Plug 'kana/vim-operator-user'

call plug#end()

filetype indent plugin on

if has("syntax")
    syntax on
endif

"source ~/.vim/bundle/tslime.vim/tslime.vim

let mapleader = " "
set tags=./tags,tags;$HOME

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Makes files with long lines much, much faster
nnoremap <leader>ll :syntax off<cr>:syntax on<cr>

"""
" Use Mouse
"""
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode. This allows you to resize splits
    " with the mouse in xterm
    set ttymouse=xterm2
endif

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
"set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,preview
set wildignore+=*.so,*.swp,*.zip,*.class
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_filename_include_exprs
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \   'tex' : ['{', '\']
            \ }

"""
" Preview window
"""
autocmd cursormovedi * if pumvisible() == 0|pclose|endif " close if cursor moves
autocmd insertleave * if pumvisible() == 0|pclose|endif " close on leave insert

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
set laststatus=2 " Done by sensible
set ruler " Done by sensible
set visualbell
set showcmd " Done by sensible
set showmatch
set guifont=Monaco\ for\ Powerline:h10

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
"let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode "$*"'
"let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode "$*"'
"let g:LatexBox_viewer = "open -a Skim"
"let g:LatexBox_latexmk_async = 1
" Replaces latex code with what stuff looks like it... not sure how I feel
" about it
let g:tex_conceal = ""
nnoremap <leader>lp :Latexmk<CR>

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
nnoremap <leader>u :UndotreeToggle<CR>

"""
" Vimwiki
"""
let g:vimwiki_list = [{'path': '~/MEGAsync/notes/',
			\ 'path_html': '~/MEGAsync/notes_html/'}]

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

"""
" terminal
"""

nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-h> <c-w>h
nnoremap <a-l> <c-w>l
vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-l> <c-\><c-n><c-w>l
if has('nvim')
    tnoremap <a-j> <c-\><c-n><c-w>j
    tnoremap <a-k> <c-\><c-n><c-w>k
    tnoremap <a-l> <c-\><c-n><c-w>l
    tnoremap <a-h> <c-\><c-n><c-w>h
    tnoremap <esc> <c-\><c-n>
endif

map <leader>sl <Plug>(operator-send-left)

function! ExecuteOnTextObject(type, cmd)
    let saved_register = @@
    if a:type == 'v'
        normal! `<v`>y
    elseif a:type ==# 'char' || a:type ==# 'line'
        normal! `[v`]y
    endif

    execute a:cmd

    let @@ = saved_register
endfunction

function! GetTextObject(type)
    let saved_register = @@
    if a:type == 'v'
        normal! `<v`>y
    elseif a:type ==# 'char' || a:type ==# 'line'
        normal! `[v`]y
    endif
    let text = @@
    let @@ = saved_register
    return text
endfunction

function! SendDirection(type, direction, back)
    execute "normal! \<c-w>" . a:direction . "i" . GetTextObject(a:type) . "\<c-\>\<c-n>\<c-w>" . a:back
endfunction

function! SendRightOp(type)
    call SendDirection(a:type, 'l', 'h')
endfunction
function! SendLeftOp(type)
    call SendDirection(a:type, 'h', 'l')
endfunction
function! SendUpOp(type)
    call SendDirection(a:type, 'k', 'j')
endfunction
function! SendDownOp(type)
    call SendDirection(a:type, 'j', 'k')
endfunction

nnoremap <Leader>sl :set operatorfunc=SendRightOp<CR>g@
vnoremap <Leader>sl :<C-U>call SendRightOp(visualmode())<CR>
nnoremap <Leader>sh :set operatorfunc=SendLeftOp<CR>g@
vnoremap <Leader>sh :<C-U>call SendLeftOp(visualmode())<CR>
nnoremap <Leader>sk :set operatorfunc=SendUpOp<CR>g@
vnoremap <Leader>sk :<C-U>call SendUpOp(visualmode())<CR>
nnoremap <Leader>sj :set operatorfunc=SendDownOp<CR>g@
vnoremap <Leader>sj :<C-U>call SendDownOp(visualmode())<CR>
