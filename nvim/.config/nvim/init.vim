" https://raw.githubusercontent.com/sammyjeng/dotfiles/master/nvim/.config/nvim/init.vim
" Nvim config --> .config/nvim/init.vim

" Vim-plug initialization
" let vim_plug_just_installed = 0
" let vim_plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
" if !filereadable(vim_plug_path)
"     echo "Installing Vim-plug..."
"     echo ""
"     silent !mkdir -p ~/.vim/autoload
"     silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     let vim_plug_just_installed = 1
" endif
"
"  manually load vim-plug the first time
" if vim_plug_just_installed
"     :execute 'source '.fnameescape(vim_plug_path)
" endif

" ==================== Active plugins ===============================
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'neomake/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'tmhedberg/SimpylFold'
Plug 'tell-k/vim-autopep8'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'mhinz/vim-signify'
Plug 'fisadev/dragvisuals.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'scrooloose/syntastic'
Plug 'justinmk/vim-sneak'
Plug 'sheerun/vim-polyglot'
" colorschemes
Plug 'owickstrom/vim-colors-paramount'
Plug 'whatyouhide/vim-gotham'
Plug 'fxn/vim-monochrome'
Plug 'ajh17/spacegray.vim'
Plug 'wesgibbs/vim-irblack'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

call plug#end()

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
syntax enable

" --------------Python syntax check----------------------------------
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

" vim-sneak
let g:sneak#label = 1

" map leader key to <Space>
let mapleader =  "\<Space>"
" map , :
nnoremap , :

set ru sc hls is ic scs ai ts=4 sw=4 sts=4 list lbr nu smd ls=2 so=1 cul
set listchars=tab:»\ ,trail:␣,extends:▶,precedes:◀
set clipboard^=unnamed,unnamedplus
set smartcase
set noswapfile
set mouse=a
set termguicolors
set bg=dark
set modeline
set title
set colorcolumn=80
set nowrap
set scrolloff=3
vmap < <gv
vmap > >gv

highlight OverLength ctermfg=green
highlight colorcolumn  ctermbg=gray ctermfg=white
match OverLength /\%81v.\+/
set background=dark
set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme spaceduck

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

" autocomplete window hide
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Comment this line to enable autocompletion preview window
" Disabled by default because preview makes the window flicker
set completeopt-=preview
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" ============ Plugins settings and mappings ========================
" NERDTree
" toggle nerdtree display
nnoremap <Leader>q  :NERDTreeToggle<CR>
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

" --------------------------- Jedi-vim ------------------------------
let g:jedi#goto_command = ',d'
let g:jedi#usages_command = ',o'
let g:jedi#goto_assignments_command = ',a'
nmap ,D :tab split<CR>:call jedi#goto()<CR>
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

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

" -------------Func to remove traling whiteSpaces--------------------
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
noremap <Leader>w :call TrimWhitespace()<CR>

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

" -------------Goyo for Zen coding-----------------------------------

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
map <Leader>G :Goyo <CR>

fun! Based()
  :%! xargs base64 -d
endfun
noremap <Leader>b :call Based()<CR>
