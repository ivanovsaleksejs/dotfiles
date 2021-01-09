if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://github.com/junegunn/vim-plug/raw/master/plug.vim

    function! AuPlugged()
        exe ':PlugInstall'
        echom 'Installing plugins... **Restart Vim to load them!**'
    endfunction
    augroup AuPlugged
        autocmd!
        autocmd VimEnter * call AuPlugged()
    augroup END
endif

call plug#begin('~/.config/nvim/plugged')

" File finder (fuzzy search, regex and more).
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

Plug 'vim-vdebug/vdebug'

" Language server and completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Search in files
Plug 'https://github.com/eugen0329/vim-esearch'

" Easily delete, change and add such surroundings in pairs.
Plug 'https://github.com/tpope/vim-surround'

" GitHub-like colorscheme
Plug 'https://github.com/endel/vim-github-colorscheme'

Plug 'https://github.com/aonemd/kuroi.vim'

" PaperColor colorscheme
Plug 'https://github.com/NLKNguyen/papercolor-theme'

Plug 'https://github.com/tpope/vim-sleuth'

" Commenter
Plug 'scrooloose/nerdcommenter'


"Plug 'lifepillar/vim-mucomplete'

" Indent
Plug 'junegunn/vim-easy-align'

" PHP syntax highlight
Plug 'https://github.com/StanAngeloff/php.vim', {'for': 'php'}

" Haskell syntax highlight and indentation
Plug 'https://github.com/neovimhaskell/haskell-vim'

" nix syntax highlight and completion
Plug 'LnL7/vim-nix'

Plug 'https://github.com/elzr/vim-json', {'for': 'json'}
Plug 'https://github.com/pangloss/vim-javascript', {'for': ['json', 'javascript', 'javascript.jsx']}

call plug#end()

" Add some filetypes
au BufNewFile,BufRead *.hs set filetype=haskell
au BufNewFile,BufRead *.nix set filetype=nix
au BufNewFile,BufRead *.inc set filetype=php

" General
set number
set mouse=a
set incsearch
set showcmd
set shell=/bin/sh
set scrolloff=5
set modifiable ma

" Use spaces when inserting a tab.
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" Indentation for .nix files
au FileType nix set tabstop=2
au FileType nix set shiftwidth=2

set termguicolors
set background=dark
colorscheme kuroi
" PaperColor scheme for diff
au FileType diff colorscheme PaperColor
au FileType diff set background=light

" Do not create swap-files.
set noswapfile

" List options
set list listchars=tab:»·,trail:·,eol:¶
set list!

" Cursor line
highlight NonText ctermfg=240 ctermbg=250 guifg=#a0a0a0
highlight CursorLine cterm=NONE ctermbg=254 guibg=#333333
set cursorline
" Matching parentheses
highlight MatchParen cterm=NONE ctermbg=174 guifg=#fcd01e guibg=#000 gui=bold
" Tabs
highlight TabLine guifg=#333333 guibg=#a0a0a0
highlight TabLineSel guifg=#000000 guibg=#b0b0b0


" Add dash sign as word character for CSS files
au FileType css set iskeyword+=-

" Configuration for Omnicomplete and mucomplete
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set completeopt+=noinsert

inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")

set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

let g:mucomplete#enable_auto_at_startup = 1

" Key bindings
imap <Ins> <NOP>
nnoremap <M-d> :CtrlP<CR>
nnoremap :W :%s/\s\+$//e<CR>:w
vmap <C-c> "+y
vmap <C-v> "0p
nnoremap <M-v> ci'<C-r>+<ESC>

nnoremap <C-l> :set list!<CR>
nnoremap <M-l> :tabn<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-Left> :tabp<CR>
nmap <C-C> :let @" = expand("%")<CR>
nmap <C-s> :CocCommand explorer<CR>

" Open esearch dialog
call esearch#map('<C-g>', 'esearch')
call esearch#map('<M-g>', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<C-f>', 'esearch-word-under-cursor')

hi Search ctermfg=black ctermbg=white guifg=#000000 guibg=#FACE8D
hi ESearchMatch ctermfg=black ctermbg=white guifg=#000000 guibg=#FACE8D
