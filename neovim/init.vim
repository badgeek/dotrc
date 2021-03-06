" Auto load plugin auto install

"if empty(glob('~/.vim/autoload/plug.vim'))
 " silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
 "       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.vim/plugged')
"Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'
Plug 'skywind3000/asyncrun.vim'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine' 
"Plug 'metakirby5/codi.vim'
"Plug 'takac/vim-hardtime'
"Plug 'chrisbra/NrrwRgn'
"Plug 'dhruvasagar/vim-zoom'

"Filetype
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"Documentation helper
"Plug 'rhysd/devdocs.vim'

"Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

"Theme
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim' 
"Plug 'KeitaNakamura/neodark.vim'
"Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'

"Completion
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

"if has('nvim')
""  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
""  Plug 'Shougo/deoplete.nvim'
""  Plug 'roxma/nvim-yarp'
""  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'

call plug#end()


let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard+=unnamedplus

set mouse=a

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
syntax on
colorscheme ayu

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

set encoding=UTF-8

" Lightlinw
set laststatus=2
"if !has('gui_running')
"  set t_Co=256
"endif
set noshowmode

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"let g:user_emmet_leader_key='<Tab>'
"let g:user_emmet_settings = {
"  \  'javascript.jsx' : {
"    \      'extends' : 'jsx',
"    \  },
"  \}

set guifont=DroidSansMono_Nerd_Font:h12


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=" "

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
au BufNewFile,BufRead *.vundle set filetype=vim

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Custom Settings ========================
" so ~/.yadr/vim/settings.vim
"


" ================ NerdTree ================================
"
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

nnoremap <Leader>f :NERDTreeToggle<Enter>
noremap <Leader>w :write<CR>
noremap <Leader>q :q!<CR>
noremap <Leader>t :Tagbar<CR>
noremap <Leader>s :Snippets<CR>
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
map ; :Files<CR>
"imap <C-m>     <Plug>(neosnippet_expand_or_jump)
"smap <C-m>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-m>     <Plug>(neosnippet_expand_target)
"let g:deoplete#enable_at_startup = 1



inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

