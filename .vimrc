" Make Vim more useful
set nocompatible
set t_Co=256
colorscheme default

" Use the Solarized Dark theme
"set background=dark
"let g:solarized_termcolors= 16
"let g:solarized_termtrans = 16
"let g:solarized_bold = 1
"let g:solarized_underline = 1
"let g:solarized_italic = 1
"let g:solarized_contrast = "high"
"let g:solarized_visibility= "high"


"colorscheme default


"" Plugins:
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')" Any valid git URL is allowed for plugin
"Plug 'Valloric/YouCompleteMe'
"Plug 'tpope/vim-obsession'
"Plug 'gikmx/ctrlp-obsession'
"Plug 'dhruvasagar/vim-prosession'
Plug 'ajh17/VimCompletesMe'  " tab completion does local keyword completion (^X^N), file path completion (^X^F) and omni-completion(^X^O)
Plug 'bagrat/vim-workspace'
Plug 'bogado/file-line'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chrisbra/csv.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'takac/vim-hardtime'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
"Plug 'SirVer/ultisnips'    " Snippet engine
"Plug 'honza/vim-snippets'   " Default snippets
"Plug 'drmingdrmer/xptemplate'
call plug#end()



"""" Plugin options
" vim workspace "
noremap <Tab> :WSNext<CR>
noremap <S-Tab> :WSPrev<CR>
noremap <Leader><Tab> :WSClose<CR>
noremap <Leader><S-Tab> :WSClose!<CR>
noremap <C-t> :WSTabNew<CR>

cabbrev bonly WSBufOnly
"

" Ultrasnippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
"


" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
" set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    " Create dirs
    set undodir=$HOME/.vim/undo " directory must exist!
    set undofile
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif


" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
"set cursorline
" Make tabs as wide as four spaces
set tabstop=4
" Show “invisible” characters
"set invlist
set listchars=tab:>-,trail:·,eol:$,nbsp:_
" Set Highlight for listchars
highlight NonText ctermfg=darkgrey
highlight SpecialKey ctermfg=darkgrey
highlight LineNr ctermfg=darkgrey guifg=#050505
" Toggle listchars with <leader>l
nmap <leader>l :set invlist<cr>
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in GUI mode
if has("gui_running")
    set mouse=a
else
    set mouse=
endif

" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
"set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

    " add templates in templates/ using filetype as file name
    "autocmd BufNewFile * silent! 0r $HOME/.templates/skeleton.%:e

    " Jump to last open position
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif

endif

" View buffers with <Leader>b
"  :b  lets you autocomplete any open buffer
"  :b! switch, and set current buffer to hidden
"  :ls gives you buffers that you have currently open
nnoremap <Leader>b :ls<CR>:b!<Space>#

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
if has("wildmenu")
    " make tab perform for autocompletion as the terminal
    set wildmenu
    set wildmode=longest:list
endif

" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
"   ^] to jump to tag under cursor
"  g^] for ambiguous tags
"   ^t to jump back up the tag stack
"   ^o to return
command! MakeTags !ctags -R .

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" - ^p to go back


" FILE BROWSING:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

if v:version >= 704
    let g:netrw_list_hide=netrw_gitignore#Hide()
    let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
endif


" SNIPPETS:
" Read an empty HTML template and move cursor to title
" - Take over the world!
"   (with much fewer keystrokes)
"nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>/title<CR>f>a
nnoremap ,cpp_main :-1read $HOME/.vim/.skeleton.cpp<CR>/title<CR>f>a
nnoremap ,pl :-1read $HOME/.vim/.skeleton.pl<CR>Gi

" BUILD INTEGRATION:
" - Run :make to run make
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back


" REGISTERS AND MACROS:
" - "ky   Yank current selection into register k 
" - "kyy  Yank current line into register k
" - "Kyy  Append current line to registerk
" - "kp   Paste register k
"
" - qm    Record into register m
" - @m    Execute register m
" - 100@m Execute register m 100 times
"
" - let @d='<td></td>'   Set register d!!
" - echo @d              Echo @d
"
" Special registers:
"   +   System clipboard
"   *   Mouse highlight clipboard
"   0   Holds the last yank
"   -   Last small delete
"   1-9 Last delete or change registers
"   /   Last search command
"   :   Last command
"
" :reg  Currently defined registers
"
" CTRL-R {0-9a-z"%#:-=.}                  *c_CTRL-R* *c_<C-R>*
"        Insert the contents of a numbered or named register.  Between
"        typing CTRL-R and the second character '"' will be displayed
"        <...snip...>
"        Special registers:
"            '"' the unnamed register, containing the text of
"                the last delete or yank
"            '%' the current file name
"            '#' the alternate file name
"            '*' the clipboard contents (X11: primary selection)
"            '+' the clipboard contents
"            '/' the last search pattern
"            ':' the last command-line
"            '-' the last small (less than a line) delete
"            '.' the last inserted text
"                            *c_CTRL-R_=*
"            '=' the expression register: you are prompted to
"                enter an expression (see |expression|)
"                (doesn't work at the expression prompt; some
"                things such as changing the buffer or current
"                window are not allowed to avoid side effects)
"                When the result is a |List| the items are used
"                as lines.  They can have line breaks inside
"                too.
"                When the result is a Float it's automatically
"                converted to a String.
"        See |registers| about registers.  {not in Vi}
"        <...snip...>
"


" MOVEMENTS:
" B and E !!!!!!
" H M L !!!!
" zz !!
" :g/virus/norm EEa% !!! Append % in the second column for all lines matching  virus


" HELP:
" :help   ^n    Show me what Ctrl-N does in normal mode
" :help i_^n         -||-                in insert mode
" :help c_^n         -||-                in command mode
"
" :helpgrep KEYWORD
"
" q:, or :<C-f>, instead provides a way to browse your command-line history and edit it like a normal buffer. This makes it easy to find a previous command you ran, edit it with normal Vim commands, and then run the modified command. 
" The q/ and q? commands exist to provide the same functionality for the search history.