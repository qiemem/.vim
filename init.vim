if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

"Plug 'kchmck/vim-coffee-script'
"Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'kshenoy/vim-signature'
Plug 'iCyMind/NeoSolarized'
Plug 'leshill/vim-json'
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'c9s/vimomni.vim'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-lion'
Plug 'wellle/targets.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
Plug 'qiemem/grepop'
Plug 'qpkorr/vim-bufkill'
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-scala'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'metakirby5/codi.vim'
Plug 'chrisbra/improvedft'
Plug 'vim-voom/VOoM'
Plug 'w0rp/ale'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'neomake/neomake'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'junegunn/goyo.vim'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
"Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
"Plug 'maralla/completor.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'sheerun/vim-polyglot'
Plug 'digitaltoad/vim-pug'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif
"Plug 'terryma/vim-smooth-scroll'
"Plug 'yuttie/comfortable-motion.vim'

call plug#end()

filetype indent plugin on

if has("syntax")
    syntax on
endif

"source ~/.vim/bundle/tslime.vim/tslime.vim

let mapleader = " "
let maplocalleader = " "
set tags=./tags,tags;$HOME

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Makes files with long lines much, much faster
" Don't think this is needed anymore
"nnoremap <leader>ll :syntax off<cr>:syntax on<cr>

set clipboard=unnamed ",unnamedplus

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
set wildignorecase

set completeopt=longest,menuone
set wildignore+=*.so,*.swp,*.zip,*.class

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1

let g:completor_python_binary = '/usr/local/bin/python3'

"""
" Preview window
"""
"autocmd cursormovedi * if pumvisible() == 0|pclose|endif " close if cursor moves
"autocmd insertleave * if pumvisible() == 0|pclose|endif " close on leave insert

"""
" Quickfix
"""

let g:ale_linters = {
\   'pandoc': ['proselint'],
\   'cpp': ['clang'],
\}
autocmd BufEnter *.cpp,*.h,*.hpp,*.hxx let g:ale_cpp_clang_options = join(ncm_clang#compilation_info()['args'], ' ')

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"""
" Tags
"""
"let g:easytags_async = 1

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
set lazyredraw
set number
set cursorline
"set laststatus=2 " Done by sensible
"set ruler " Done by sensible
set visualbell
"set showcmd " Done by sensible
set showmatch
if !has('gui_vimr')
  set guifont=Inconsolata-dz\ for\ Powerline:h10
endif

"""
" Color
"""
set termguicolors
set background=dark
colorscheme NeoSolarized
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=DarkGray   ctermbg=8
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=Black ctermbg=0
"let g:solarized_diffmode="normal"


"""
" Encoding stuff
"""
" set fileformats=unix,mac,dos " Done by sensible

"""
" LaTeX
"""
let g:tex_conceal = ""
nnoremap <leader>lp :Latexmk<CR>
"let g:LatexBox_latexmk_async=1
"let g:LatexBox_latexmk_preview_continuously=1
"let g:LatexBox_quickfix=4
let g:vimtex_imaps_enabled = 0
let g:polyglot_disabled = ['latex']

"""
" Markdown
"""

let g:pandoc#syntax#conceal#use = 0
"let g:pandoc#command#autoexec_command = "Pandoc pdf -F pandoc-crossref -N"
"let g:pandoc#command#autoexec_on_writes = 1

"""
" Jumping
"""

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! MyFZF(options)
    call fzf#run(extend({'down': '40%', 'options': '-m', 'sink': 'e'}, a:options, 'force'))
endfunction

"let g:fzf_layout = { 'up': '~40%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

noremap <leader>ff :Files<CR>
noremap <leader>fb :Buffers<CR>
noremap <leader>/ :execute 'Rg ' . input('Rg/')<CR>
noremap <leader>fl :Lines<CR>
noremap <leader>f/ :BLines<CR>
noremap <leader>fm :Marks<CR>
noremap <leader>fr :History<CR>
noremap <leader>f: :History:<CR>
noremap <leader>fc :Commands<CR>
noremap <leader>fa :call MyFZF({'source': 'rg -u -l'})<CR>
noremap <leader>fg :GitFiles<CR>
noremap <leader>ft :Tags<CR>
noremap <leader>fj :BTags<CR>

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
" Vimwiki
"""
let g:vimwiki_list = [{'path': '~/MEGAsync/notes/',
			\ 'path_html': '~/MEGAsync/notes_html/'}]

"""
" Codi
"""

let g:codi#interpreters = {
      \ 'scala': {
        \ 'bin': 'scala',
        \ 'prompt': '^\(scala>\|     |\) ',
      \ },
      \ 'python': {
        \ 'bin': 'python3',
        \ 'prompt': '^\(>>>\|\.\.\.\) ',
      \ },
  \ }

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

let g:cellmode_default_mappings='0'
let g:cellmode_tmux_panenumber='2'

noremap <leader>cb :call RunTmuxPythonCell(0)<Enter>
noremap <leader>cg :call RunTmuxPythonCell(1)<Enter>
noremap <leader>cc :call RunTmuxPythonChunk()<Enter>
noremap <leader>cl :call RunTmuxPythonLine()<Enter>


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

:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0
