" ----------------------------| NEOVIM CONFIG |-------------------------------

" ============================================================================
"                                                                      PLUGINS
" ============================================================================
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
" Plug 'rose-pine/neovim',{'as':'rose-pine'}
Plug 'neoclide/coc.nvim',{'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'karb94/neoscroll.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
" ============================================================================
"                                                                       THEMES
" ============================================================================

set termguicolors
""" AYU
let ayucolor="mirage"
let ayucolor="dark"
" IndentLine {{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
""" GRUVBOX
" let g:gruvbox_contrast_dark="hard"
" let g:gruvbox_contrast_light="soft"
" let g:gruvbox_italic=1
" set·colorscheme·(gruvbox,·catppuccin, ayu)
colorscheme ayu

" ============================================================================
"                                                                      GENERAL
" ============================================================================

"command W w !sudo tee "%" > /dev/null
set cursorline
" To enter term in split `:sp term://zsh` or `:vsp term://zsh`
set shell=/usr/bin/bash
" Use Escape key to exit terminal mode
tnoremap <Esc> <C-\><C-n>
set nocompatible
set colorcolumn=80
set nowrap
set updatetime=50
syntax on
set number
set relativenumber
set laststatus=2
" use the system clipboard instead of buffer
" if it doesn't work, install [xclip for x11] or [wl-copy and wl-paste for wayland]
set clipboard=unnamed
set clipboard=unnamedplus
set backspace=indent,eol,start
set expandtab
set tabstop=4 shiftwidth=4
set hidden
set nobackup
set noswapfile
" or save backups/swaps in a different location:
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//
set ignorecase
set smartcase
set incsearch
set wildmenu
set wildmode=list:longest,full
nmap Q <Nop>
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
"                                                                      AIRLINE
" ============================================================================

let g:airline_powerline_fonts = 1

" ============================================================================
"                                                                      NEOVIDE
" ============================================================================

" sets font for neovide
" set guifont=FiraCode\ NF:h11
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

" ============================================================================
"                                                                          FZF
" ============================================================================

" requires fzf, bat, the_silver_searcher(ag), ripgrep(rg), [fugitive or delta]
" CTRL-T / CTRL-X / CTRL-V (new tab / a new split / vertical split)
nmap <C-P> :FZF<CR>
" use ag to search for hidden files
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!.git"'
