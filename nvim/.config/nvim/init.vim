" https://raw.githubusercontent.com/sammyjeng/dotfiles/master/nvim/.config/nvim/init.vim
" Nvim config --> .config/nvim/init.vim

" Vim-plug initialization
" let vim_plug_just_installed = 0
" let vim_plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
" if !filereadable(vim_plug_path)
"	  echo 'Installing Vim-plug...'
"	  echo ' '
"	  silent !mkdir -p ~/.vim/autoload
"	  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"	  let vim_plug_just_installed = 1
" endif
"
"  manually load vim-plug the first time
" if vim_plug_just_installed
"	  :execute 'source '.fnameescape(vim_plug_path)
" endif


" ==================== Active plugins ===============================
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
" Go-lang stuff
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/vim-goimports'
" markdown, synatax and autopairs
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
" colorschemes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'danishprakash/vim-yami'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin on
filetype indent on
syntax enable
noremap , :
let mapleader = "\<Space>"
syntax on
set encoding=utf-8
set wrap
set hidden
set backspace=eol,start,indent
set showbreak=↪\
set bg=dark
set noswapfile
set rnu nu
set hlsearch
set gdefault
set showmatch
set ruler
set smartcase
set ignorecase
set clipboard+=unnamedplus
set termguicolors
set showmode
set modeline
set title
set autoindent
set dir=/tmp
set backupdir=/tmp
set background=dark
set mouse=a
set t_Co=256
highlight Comment ctermfg=yellow
highlight showmode ctermfg=black

vmap < <gv
vmap > >gv


" ALE
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
let g:rustfmt_autosave = 1
let g:ale_rust_analyzer_executable = 1
let g:ale_linters = {'rust': ['rustc', 'rls']}
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'rust': ['rustfmt'],
\}


let g:goimports = 1
let g:go_version_warning = 0
let g:go_fmt_command = "goimports"
au FileType go set
      \  noexpandtab
      \  shiftwidth=4
      \  softtabstop=4
      \  tabstop=4
      \  nolist
let g:go_disable_autoinstall = 1

au Filetype python set
     \ list
     \ listchars=tab:\¦\ ,nbsp:•,trail:•,extends:▶,precedes:◀
     \ tabstop=4
     \ softtabstop=4
     \ shiftwidth=4
     \ textwidth=79
     \ et ts=4
autocmd Filetype python :ALEDisable

let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material
let g:airline_theme = "atomic"
let g:airline#extensions#tabline#enabled = 1

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" TOhtml
let g:html_number_lines = 0
let g:html_use_encoding = "UTF-8"

" tab navigation mappings
nnoremap <leader>n :tabnew<Space>
nnoremap <leader>k :tabnext<CR>
nnoremap <leader>j :tabprev<CR>
nnoremap <leader>h :tabfirst<CR>
nnoremap <leader>l :tablast<CR>

" line wrapping thingy
nnoremap <leader>u :% norm zo<CR>
nnoremap <leader>U :% norm zc<CR>

" Add spellchecks for md files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
"
" Syntax highlighting for asm
autocmd BufRead,BufNewFile *.asm set ft=nasm


" Comment this line to enable autocompletion preview window
" Disabled by default because preview makes the window flicker
set completeopt-=preview
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" ============ Plugins settings and mappings ========================
" NERDTree
" toggle nerdtree display
nnoremap <Leader>q	:NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap <leader>f :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" ----------------------Instant view of MD files---------------------
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 1
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1

fun! TrimSave()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun
noremap <Leader>s :call TrimSave()<CR>
