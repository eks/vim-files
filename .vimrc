call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'garbas/vim-snipmate'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'zhaocai/GoldenView.Vim'
Plug 'stulzer/heroku-colorscheme'
Plug 'othree/html5.vim'
Plug 'claco/jasmine.vim'
Plug 'nono/jquery.vim'
Plug 'keith/rspec.vim', { 'for': '*_spec.rb' }
Plug 'scrooloose/snipmate-snippets'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'bling/vim-airline'
Plug 'tpope/vim-bundler'
Plug 'kchmck/vim-coffee-script'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'andersoncustodio/vim-enter-indent'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'reinh/vim-makegreen'
Plug 'tpope/vim-markdown'
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-rvm'
" Plug 'thoughtbot/vim-rspec'
Plug 'duff/vim-scratch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'jgdavey/vim-turbux'
" Plug 'benmills/vimux'
Plug 'yunake/vimux'
" Plug 'tpope/vim-unimpaired'
Plug 'thinca/vim-visualstar'
Plug 'skalnik/vim-vroom'

" Add plugins to &runtimepath
call plug#end()

" execute pathogen#infect()
" call pathogen#infect()

set nocompatible

syntax on

" Auto detect filetype
filetype plugin indent on

runtime macros/matchit.vim

" match unnamed with system clipboard
set clipboard=unnamed

" Display current mode
set showmode

" Intuitive basckspace
set backspace=indent,eol,start

" Handle multiple buffer better
set hidden

" Enhanced command line commands
set wildignore+=.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.swf,*.egg,*.jar,*.dump,*.gem
set wildmenu
set wildmode=list:longest

" Ignore certain folders
set wildignore+=public/uploads
set wildignore+=public/spree
set wildignore+=tmp

" Ignore case when search
set ignorecase
" If expression has capital letter the case is relevant
set smartcase

" Remaping the <Leader> key.
let mapleader = ","

" Show line numbers
set number

" Highlight match as you type
set incsearch
set hlsearch
set showmatch
set matchtime=2 " time in decisecons to jump back from matching bracket

" Turn on line wrapping.
set wrap
" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

" No more annoying beeps
" THIS FUCKING THING WAS FUCKING THINGS ON UBUNTU
" set visualbell

" Don't make a backup before overwriting a file.
" set nobackup
" set nowritebackup

" Keep swap files in one location
" set directory=$HOME/.vim/tmp//,.
" set directory=/Volumes/ramdisk/tmp//,.

" Default tab width
set tabstop=2
set shiftwidth=2
" Use spaces instead of tabs
set expandtab
set pastetoggle=<F12>

" colorscheme Tomorrow
" set background=light
colorscheme heroku-terminal
set background=dark

" Mapping for tab manipulation
map <leader>tt :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tm :tabmove

" Configures VROOM
" Detecting rails spring for rspec
if filereadable('bin/spring')
  let g:vroom_use_spring = 1
else
  let g:vroom_use_spring = 0
end
" Detecting rails binstubs for rspec
if filereadable("bin/rspec")
  let g:vroom_use_binstubs = 1
else
  let g:vroom_use_binstubs = 0
end

let g:vroom_write_all = 1
let g:vroom_use_colors = 1
let g:vroom_clear_screen = 1
let g:vroom_use_vimux = 1

" Trigger to run the whole RSpec suite
" function ClearScreenAndRunRSpec()
"   :silent !clear
"   if filereadable("bin/rspec")
"     : !./bin/rspec
"   else
"     : !bundle exec rspec
"   end
" endfunction
" map <leader>R :call ClearScreenAndRunRSpec()<cr>

" For the MakeGreen plugin and Ruby RSpec
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
nmap <leader>t :MakeGreen %<CR>

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

autocmd! BufRead,BufNewFile *.sass setfiletype sass

" Set line break
set linebreak
" Don't show invisibles
set nolist
" Invisibles for tab and end of line
" set listchars=tab:▸\ ,eol:¬

" Blank chars colors
highlight NonText guifg=#143c46
highlight SpecialKey guifg=#143c46

" spell checker, Portuguese and English as default language
set spelllang=pt,en_us
set spell

" fast nohighligth
map <leader>q :noh<cr>
" Mapping to show or hide invisibles
map <leader>d :set list!<cr>
" Execute the current file in nodejs
map <leader>nd :!node %<cr>
" Mapping for quick js/less/scss folding
nmap <leader>f vi{zf
" Execute test unit
map <leader>u :!bundle exec rake test TEST=%<cr>
map <leader>U :!bundle exec rake<cr>

" Function to align key value fat arrows in ruby, and equals in js, stolen
" from @tenderlove vimrc file.
command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
vnoremap <silent> <Leader>a :Align<cr>
function! AlignSection(regex) range
  let extra = 1
  let sep = empty(a:regex) ? '=' : a:regex
  let maxpos = 0
  let section = getline(a:firstline, a:lastline)
  for line in section
    let pos = match(line, ' *'.sep)
    if maxpos < pos
      let maxpos = pos
    endif
  endfor
  call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
  call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
  let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
  if empty(m)
    return a:line
  endif
  let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
  return m[1] . spaces . m[2]
endfunction

if has('cmdline_info')
  set ruler                   " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd                 " show partial commands in status line and
  " selected characters/lines in visual mode
endif
" set relativenumber "Dont know if I like it yet... =/

if has('statusline')
  set laststatus=2
endif

" Nice way to corret typos saving, editing and deleting buffers
if has("user_commands")
  command! -bang -nargs=* -complete=file E e<bang> <args>
  command! -bang -nargs=* -complete=file W w<bang> <args>
  command! -bang -nargs=* -complete=file Wq wq<bang> <args>
  command! -bang -nargs=* -complete=file WQ wq<bang> <args>
  command! -bang -nargs=* -complete=file Bd bd<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
  command! -bang Bd bd<bang>
endif

" Removed the slow rake routes function from bash
function! ShowRoutes()
  " requires vim-scratch plugin
  :topleft 100 :split __Routes__
  :set buftype=nofile
  :normal 1GdG
  :0r! bundle exec rake -s routes
  :exec ":normal " . line("$") . "^W_ "
  :normal 1GG
  :normal dd
endfunction
map <leader>cR :call ShowRoutes()<cr>

" CtrlP mapings
map <leader>cv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>ct :CtrlPClearCache<cr>\|:CtrlP app/controllers<cr>
map <leader>cm :CtrlPClearCache<cr>\|:CtrlP app/models<cr>
map <leader>ch :CtrlPClearCache<cr>\|:CtrlP app/helpers<cr>
map <leader>cs :CtrlPClearCache<cr>\|:CtrlP spec<cr>
map <leader>cl :CtrlPClearCache<cr>\|:CtrlP lib<cr>
map <leader>ca :CtrlPClearCache<cr>\|:CtrlP app/assets<cr>
map <leader>ci :CtrlPClearCache<cr>\|:CtrlP app/assets/images<cr>
map <leader>cS :CtrlPClearCache<cr>\|:CtrlP app/services<cr>
map <leader>cc :CtrlPClearCache<cr>\|:CtrlP<cr>
map <leader>cg :topleft 100 :split Gemfile<cr>

" Alternate between last opened buffer
nnoremap <leader><leader> <c-^>
" End of line and First non-blank chracter of the line
vnoremap H ^
vnoremap L $
nnoremap H ^
nnoremap L $

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Automaticaly create a directory in the current file
map <leader>md :silent !mkdir -p %%<cr> :redraw! <cr>

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>mv :call RenameFile()<cr>

augroup vimrcEx
  " Clear all autocmd in the group
  autocmd!

  " open vim in the last position of the file that you were editing
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

set history=500
" searching commands
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <C-n> :NERDTree <cr>

" " ctrlp setup
" set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  'public\/uploads\|public\/spree'
"   \ }

" delimitMate configuration
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = ""

" Cucumber
nnoremap <leader>A :!clear; bundle exec cucumber features/support/ features/<cr>
nnoremap <leader>a :!clear; bundle exec cucumber features/support/ %<cr>

" Easy way to add and subtract numbers
nnoremap + <C-a>
nnoremap _ <C-X>

" Remapping the reversal find
nnoremap <C-f> ,
vnoremap <C-f> ,

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Show syntax highlighting groups for word under cursor
nmap <C-S-X> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Highlight Whitespaces to not forget them
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Show whitespaces as dots and End of Line as ¬
" set listchars=eol:¬,trail:·
" set listchars=trail:·
" set list

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/
set cc=80

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
" let g:airline_powerline_fonts=0
let g:airline_powerline_fonts = 1
set noshowmode
let g:bufferline_echo = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" let g:airline_extensions_whitespace_enabled = 1

nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab>   :tabnext<CR>

let g:move_key_modifier = 'C'

" " RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Use Ag as default grep if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m
  command! -nargs=+ -bang Ag silent! grep <args> | redraw! | botright copen
endif

"Always start searching from project root instead of the cwd
let g:ag_working_path_mode="r"

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:multicursor_insert_maps = 1
let g:multicursor_normal_maps = 1

nmap <silent> <C-L>  <Plug>GoldenViewSplit

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gw :Gwrite
nnoremap <leader>gr :Gread
nnoremap <leader>dp :diffput<cr>:diffupdate<cr>
vnoremap <leader>dp :diffput<cr>:diffupdate<cr>
nnoremap <leader>dg :diffget<cr>:diffupdate<cr>
vnoremap <leader>dg :diffget<cr>:diffupdate<cr>
set showcmd
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:· " ,eol:¬
set showbreak=↪
set fillchars=diff:⣿,vert:│
" set mouse=a
set backspace=indent,eol,start " backspace over everything in insert mode
" set nobackup " no need for backup files(use undo files instead)
set undofile " create '.<FILENAME>.un~' for persiting undo history
set backupdir=/Volumes/ramdisk/tmp/
set directory=/Volumes/ramdisk/tmp/ " swap files storage, first try in the cwd then in /tmp
set undodir=/Volumes/ramdisk/tmp/ " undo files storage, only allow the same directory

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

let g:rspec_command = "Dispatch rspec {spec}"

" Plugin: Golden View {{{
let g:goldenview__enable_default_mapping = 0
let g:goldenview__enable_at_startup = 0
" 'e' for expand
nnoremap R :GoldenViewResize<cr>
" }}}
" " Plugin: MultiCursor {{{
" let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_next_key='D'
" let g:multi_cursor_prev_key='<c-p>'
" let g:multi_cursor_skip_key='<c-x>'
" let g:multi_cursor_quit_key='<c-c>'
" " }}}
" Plugin: NerdTree {{{
let g:NERDTreeChDirMode=2
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeMinimalUI = 1
noremap <space> :NERDTreeToggle<CR>
noremap <leader>. :NERDTreeFind<CR>
" }}}

noremap <leader>; :TagbarToggle<cr>

let g:VimuxHeight = "30"
let g:VimuxOrientation = 'v'
let g:VimuxUseNearestPane = 0
