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
Plug 'scrooloose/nerdtree'
" Go-lang stuff
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/vim-goimports'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'sheerun/vim-polyglot'
" colorschemes
Plug 'whatyouhide/vim-gotham'
Plug 'wesgibbs/vim-irblack'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'whatyouhide/vim-gotham'
call plug#end()

set encoding=utf-8
set list
set showbreak=↪\
set listchars=tab:\¦\ ,nbsp:•,trail:•,extends:▶,precedes:◀
hi NonText ctermfg=16 guifg=#4a4a59
hi SpecialKey ctermfg=16 guifg=#4a4a59
filetype plugin on
filetype indent on
syntax enable
noremap , :
let mapleader = "\<Space>"
syntax on
set bg=dark
set noswapfile
set hlsearch
set ruler
set smartcase
set clipboard+=unnamedplus
set termguicolors
set showmode
set modeline
set title
set nowrap
highlight Comment ctermfg=yellow
highlight showmode ctermfg=black
set mouse=a

vmap < <gv
vmap > >gv


let g:goimports = 1
let g:go_version_warning = 0
let g:go_fmt_command = "goimports"
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
let g:go_disable_autoinstall = 1

set autoindent
set dir=/tmp
set backupdir=/tmp

set background=dark
set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme ir_black
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'jellybeans'


" TOhtml
let g:html_number_lines = 0
let g:html_use_encoding = "UTF-8"

" tab navigation mappings
nnoremap <leader>t :tabnew<Space>
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

" ------------------------- Syntastic -------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
" custom icons (enable them if you use a patched font, and enable the previous
" setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set t_Co=256
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'jellybeans'
" let g:airline_theme='cool'

" supertab settings
set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = "<c-n>"

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

fun! ST()
	:set noet ts=4
	:%retab!
endfun
noremap <Leader>t :call ST()<CR>

fun! SAVE()
	:w
endfun
noremap <Leader>s :call SAVE()<CR>

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun
noremap <Leader>w :call TrimWhitespace()<CR>
