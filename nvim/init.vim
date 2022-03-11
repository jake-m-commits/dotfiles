" ----------------------------| NEOVIM CONFIG |-------------------------------

" ============================================================================
"                                                                      PLUGINS
" ============================================================================

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'ayu-theme/ayu-vim'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'rose-pine/neovim',{'as':'rose-pine'}
Plug 'neoclide/coc.nvim',{'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'karb94/neoscroll.nvim'
call plug#end()

" ============================================================================
"                                                                      GENERAL
" ============================================================================

" Highlight current line
set cursorline
" Set default shell to zsh for neovim
" To enter term in split `:sp term://zsh` or `:vsp term://zsh`
set shell=/usr/bin/zsh
" Use Escape key to exit terminal mode
tnoremap <Esc> <C-\><C-n>
" Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality.
set nocompatible
" activate ruler
set colorcolumn=80
" activate nowrap
set nowrap
" Reduce update time (mostly to asynchronously show git diffs)
set updatetime=50
" Turn on syntax highlighting.
syntax on
" Disable the default Vim startup message.
" set shortmess+=I
" Show line numbers.
set number
set relativenumber
" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" use the system clipboard instead of buffer
" if it doesn't work, install [xclip for x11] or [wl-copy and wl-paste for
" wayland]
set clipboard=unnamed
set clipboard=unnamedplus
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
" alternatively you could save them in a different location:
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
" Enable wildmenu, a little menu that displays files and commands in the buttom left corner
set wildmenu
set wildmode=list:longest,full
" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" ============================================================================
"                                                                 NETRW CONFIG
" ============================================================================

let g:netrw_keepdir = 0                        " avoid move files error
let g:netrw_liststyle = 3                      " set tree like view
let g:netrw_banner = 0                         " remove top banner
let g:netrw_browse_split = 2                   " open in vertical split
let g:netrw_localcopydircmd = 'cp -r'          " enable recursive copy for dirs
let g:netrw_winsize = 20                       " set width to 20% of screen
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dot files by default
augroup netrw_setup | au!
  au FileType netrw nmap <buffer> l <CR>
augroup END
nnoremap <silent> ,e :Lexplore<cr>
set splitright

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
"                                                                   AUTO-PAIRS
" ============================================================================

" ( alt+p ) toggle autopairs

" ============================================================================
"                                                        WHITESPACE MANAGEMENT
" ============================================================================

" show whitespace
set listchars=tab:>--,space:·,trail:~,extends:>,precedes:<
set list

" ============================================================================
"                                    (vim-snippets+coc-snippets) Code Snippets
" ============================================================================

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Make <tab> trigger, confirm, expand and jump.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ============================================================================
"                                                                 CoC SETTINGS
" ============================================================================

" CoC tab and shift+tab to navigate auto-complete
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
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
"·set·colorscheme·(gruvbox,·dracula,·ayu, molokai, badwolf, rose-pine)
colorscheme ayu

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
let g:airline_powerline_fonts = 1

" ============================================================================
"                                                                      NEOVIDE
" ============================================================================

" sets font for neovide
set guifont=FiraCode\ NF:h11
" set guifont=Dank\ Mono:h8.5
" set mouse scrolling and compatibility with neovide
set mouse=a
"sets certain visual effects for cursor
"let g:neovide_cursor_vfx_mode = "pixiedust

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

" ============================================================================
"                                                                    SIMPYFOLD
" ============================================================================

let g:SimpylFold_docstring_preview = 1

" ============================================================================
"                                                                    NEOSCROLL
" ============================================================================

lua require('neoscroll').setup()
" Smooth scrolling for window movement commands (default mappings):
" <C-u>, <C-d>, <C-b>, <C-f>, <C-y>, <C-e>, zt, zz, zb.
