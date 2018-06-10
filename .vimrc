
set nocompatible
colorscheme delek
syntax on

let mapleader = ','

" Turn of highlighting on F4
set hlsearch incsearch
nmap <F4> :set hlsearch! incsearch! <CR>
imap <F4> <ESC> :set hlsearch! incsearch! <CR>i


" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    if !isdirectory($HOME."/.vim")
        call mkdir($HOME."/.vim", "", 0770)
    endif

    if !isdirectory($HOME."/.vim/undo-dir")
        call mkdir($HOME."/.vim/undo-dir", "", 0700)
    endif
    set undodir=$HOME/.vim/undo
    set undofile
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif


" Switcht to last buffer on Tab
"noremap <Tab> :b! #<CR>
"noremap <Tab><Tab> :ls<CR>:b!<Space>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Status line
set laststatus=2
set statusline=%q%m%r%F\ %l\/%L%y

set statusline=%0*
set statusline+=\%n                                 "buffernr
set statusline+=\ %<%F                              "File+path
set statusline+=\ %y                                "FileType
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}   "Encoding
set statusline+=%{(&bomb?\",BOM\":\"\")}            "Encoding2
set statusline+=\ %{&ff}                            "FileFormat (dos/unix..) 
set statusline+=\ %=\ line\ %l/%L\ (%p%%)          "Rownumber/total (%)
set statusline+=\ col\ %c                          "Colnr
set statusline+=\ %m%r%w                           "Modified? Readonly? 

call plug#begin('~/.vim/plugged')
"Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'   " Fuzzy finder! Use for Files, Buffers, etc
Plug 'tpope/vim-eunuch'   " Use :Rename, :Chmod, :SudoWrite, :Mkdir
Plug 'tpope/vim-surround' " Change and delete surroundings! ysiw<em>
call plug#end()

" Toggle number + relativenumber + GitGutter on F3 in normal and insert mode
nmap <F3> :set nu! rnu! gle<CR>
nmap <F3> :set nu! rnu! gle<CR>
nmap <F3><F3> :GitGutterToggle<CR>
imap <F3><F3> <ESC> :GitGutterToggle<CR>i

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

" FZF
noremap ; :Files<CR>
noremap <Tab> :Buffers<CR>
noremap <S-Tab> :Files<CR>
noremap // :Lines<CR>
