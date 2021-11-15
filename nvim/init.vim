" ============================================================================
" ----------------------------> NEOVIM CONFIG <-------------------------------
" ============================================================================

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality.
set nocompatible
" activate ruler
set colorcolumn=80
" activate nowrap
set nowrap
" Reduce update time (mostly to asynchronously show git diffs)
set updatetime=100
" Turn on syntax highlighting.
syntax on
" Disable the default Vim startup message.
set shortmess+=I
" Show line numbers.
set number
" This enables relative line numbering mode.
" with relative and regular the current line will show the actual line number
set relativenumber
" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" use the system clipboard instead of buffer
" depending on the distro you may need to install gvim to get this feature
" you can check that you have a version of vim capable of this by running this command 'vim --version | grep clipboard'
" if you see +clipboard it will work, if not it won't.
set clipboard=unnamedplus
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
" replace tabs with spaces
set expandtab
" 1 tab = 2 spaces
set tabstop=2 shiftwidth=2
" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden
" Do not save backup files. and swap files
set nobackup
set noswapfile
" alternatively you could save them in a different location,
" just uncomment the lines  below and comment out the nobackup and noswapfile above
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
" Enable searching as you type, rather than waiting till you press enter.
set incsearch
" enable wildmenu, a little menu that displays files and commands in the button left corner
set wildmenu
set wildmode=list:longest,full
" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
" Try to prevent bad habits like using the arrow keys for movement.
" commented out so that mouse scroll wheel works
"nnoremap <Left>  :echo \"Use h"<CR>
"nnoremap <Right> :echo \"Use l"<CR>
"nnoremap <Up>    :echo \"Use k"<CR>
"nnoremap <Down>  :echo \"Use j"<CR>
" ============================================================================
"                                                                 NETRW CONFIG
" ============================================================================

" tree file explorer with netrw
let g:netrw_keepdir = 0 " avoid move files error
let g:netrw_liststyle = 3 " set tree like view
let g:netrw_banner = 0 " remove top banner
let g:netrw_browse_split = 2 " open in vertical split
"let g:netrw_localcopydircmd = 'cp -r' " enable recursive copy for dirs
let g:netrw_winsize = 20 " set width to 20% of screen
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dot files by default
augroup netrw_setup | au!
  au FileType netrw nmap <buffer> l <CR>
augroup END
" open file explorer with ,e
nnoremap <silent> ,e :Lexplore<cr>
" set vim splits to the right
set splitright
" ============================================================================
"                                                                      PLUGINS
" ============================================================================

" Call and add plugins
call plug#begin()
" themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'ayu-theme/ayu-vim'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'kyoz/purify',{'rtp':'vim'}
" code completion using CoC
Plug 'neoclide/coc.nvim',{'branch': 'release'}
" autopairs
Plug 'jiangmiao/auto-pairs'
" rainbow brackets
Plug 'kien/rainbow_parentheses.vim'
" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" highlight yanks
Plug 'machakann/vim-highlightedyank'
" navigation for tmux
Plug 'christoomey/vim-tmux-navigator'
" code folding
Plug 'tmhedberg/SimpylFold'
" tagbar + ctags
Plug 'preservim/tagbar'
" show git info (git diffs, prevent buffer saves, show adds, mods, etc.)
Plug 'tpope/vim-fugitive'
" makes commenting easier
Plug 'tpope/vim-commentary'
" easily show git diffs
Plug 'airblade/vim-gitgutter'
call plug#end()
" ============================================================================
"                                                               VIM-COMMENTARY
" ============================================================================

" 'gc' to comment out highlighted content in VISUAL mode
" 'gcc' to comment out line under cursor
" 'gcgc' to uncomment a set of adjacent comments
" ============================================================================
"                                                                 VIM-FUGITIVE
" ============================================================================

" ============================================================================
"                                                                       TAGBAR
" ============================================================================

" set F8 to toggle the tagbar
nmap <F8> :TagbarToggle<CR>
" ============================================================================
"                                                                   AUTO-PAIRS
" ============================================================================

" ( alt+p ) toggle autopairs
" ============================================================================
"                                                        WHITESPACE MANAGEMENT
" ============================================================================

" show whitespace
set listchars=tab:>->,space:·,trail:~,extends:>,precedes:<
set list
" ============================================================================
"                                                                 CoC SETTINGS
" ============================================================================

" CoC tab and shift+tab to navigate auto-complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" CoC prettier usage(:Prettier)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" CocConfig shortcut
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
" Use CC to open coc config
call SetupCommandAbbrs('CC', 'CocConfig')
" ============================================================================
"                                                                       THEMES
" ============================================================================

" themes and term setting
set termguicolors
"let ayucolor="mirage"
let ayucolor="dark"
"·set·colorscheme·(gruvbox,·dracula,·ayu, molokai, badwolf, purify)
colorscheme gruvbox
" ============================================================================
"                                                                      AIRLINE
" ============================================================================

" some themes from github page (
"   distinguished, minimalist,
"   violet, tomorrow,
"   base16, bubblegum,
"   deus theme, dracula,
"   ayu_dark
" )
let g:airline_theme = "distinguished"
" ============================================================================
"                                                                      NEOVIDE
" ============================================================================

" sets font for neovide
"set guifont=FiraCode\ NF:h11
set guifont=Dank\ Mono:h8.5
" set mouse scrolling and compatibility with neovide
set mouse=a
"sets certain visual effects for cursor
"let g:neovide_cursor_vfx_mode = "pixiedust
" ============================================================================
"                                                              TMUX NAVIGATION
" ============================================================================

"let g:tmux_navigator_no_mappings = 1
"
"nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
"nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
"nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
" ============================================================================
"                                                             RAINBOW BRACKETS
" ============================================================================

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" set to always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" commands
":RainbowParenthesesToggle       " Toggle it on/off
":RainbowParenthesesLoadRound    " (), the default when toggling
":RainbowParenthesesLoadSquare   " []
":RainbowParenthesesLoadBraces   " {}
":RainbowParenthesesLoadChevrons " <>
" ============================================================================
"                                                                         MAPS
" ============================================================================

" Moving lines of text up or down in NORMAL, INSERT and VISUAL mode.
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

