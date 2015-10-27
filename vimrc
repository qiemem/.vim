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
"Plug 'kien/ctrlp.vim'
"Plug 'tpope/vim-fugitive'
Plug 'leshill/vim-json'
Plug 'walm/jshint.vim'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'junegunn/vim-easy-align'
"Plug 'Valloric/YouCompleteMe'
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
"Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
Plug 'qiemem/grepop'
"Plug 'tacahiroy/ctrlp-funky'
Plug 'bufkill.vim'
"Plug 'terryma/vim-multiple-cursors'
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
"Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf', 'do': 'yes \| ./install' }
Plug 'derekwyatt/vim-scala'
"Plug 'osyo-manga/vim-brightest'

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
    tnoremap <ESC><ESC> <C-\><C-n>G:call search(".", "b")<CR>$
endif

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

autocmd FileType vim setlocal shiftwidth=2 tabstop=2

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
set guifont=Inconsolata-dz\ for\ Powerline:h10

"""
" Color
"""
set background=dark
colorscheme solarized

" At some point, solarized set this to grey. This looks terrible with both
" gitgutter and signify.
"highlight SignColumn ctermbg=NONE guibg=NONE

"let g:brightest#enable_on_CursorHold = 0
"let g:brightest#highlight = {
"\   "group" : "BrightestReverse"
"\}

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
" Jumping
"""
set rtp+=/usr/local/opt/fzf
"let g:ctrlp_map = '<leader>ff'
"noremap <leader>fb :CtrlPBuffer<CR>
"noremap <leader>fr :CtrlPMRU<CR>
"noremap <leader>ff :CtrlP<CR>
"noremap <leader>fa :CtrlPMixed<CR>
"noremap <leader>fq :ccl<CR>:CtrlPQuickfix<CR>
"noremap <leader>fd :CtrlPFunky<CR>

function! MyFZF(options)
    call fzf#run(extend({'down': '40%', 'options': '-m', 'sink': 'e'}, a:options, 'force'))
endfunction

function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

function! BufDelete(e)
  execute 'bd '. matchstr(a:e, '^[ 0-9]*')
endfunction

noremap <leader>ff :FZF<CR>
noremap <leader>fa :call MyFZF({'source': 'ag -u -l'})<CR>
"noremap <leader>fm :call fzf#run({'source': 'fasd -flR', 'sink': 'e', 'down': '40%'})<CR>
noremap <leader>fm :call MyFZF({'source': 'fasd -flR'})<CR>
noremap <leader>fb :call MyFZF({'source': BufList(), 'sink': function('BufOpen')})<CR>
noremap <leader>fr :call MyFZF({'source': v:oldfiles})<CR>
noremap <leader>bd :call MyFZF({'source': BufList(), 'sink': function('BufDelete')})<CR>

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf ' . keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:ag_line_handler(l)
  let keys = split(a:l, ':')
  exec 'e ' . keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--nth=3..',
\   'down':    '40%'
\})

noremap <leader>fl :FZFLines<CR>
noremap <leader>fg :call MyFZF({'source': 'ag --nogroup .$', 'sink': function('<sid>ag_line_handler')})<CR>

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

""
" Term interaction
""
function! s:GetVisual()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][:col2 - 2]
  let lines[0] = lines[0][col1 - 1:]
  return lines
endfunction

map <leader>sl <Plug>(operator-send-left)

function! s:GetTextObject(type)
    if a:type == 'v'
        "normal! `<v`>
    elseif a:type ==# 'char' || a:type ==# 'line'
        normal! `[v`]
    endif
    return s:GetVisual()
endfunction

function! SendDirection(type, direction, back)
    let text = join(s:GetTextObject(a:type), "\n")
    execute "normal! \<c-w>" . a:direction . "i" . text . "\<c-\>\<c-n>\<c-w>" . a:back
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
