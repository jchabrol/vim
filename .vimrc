set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Best status bar ever
Plugin 'vim-airline/vim-airline'

" Git Integration
Plugin 'tpope/vim-fugitive'

" Surrounding plugin (to add quotes/parens/brackets around stuff)
Plugin 'tpope/vim-surround'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Ack support
" Beware ! git.fsck might not like this plugin. Use manual install if needed:
" git clone --config transfer.fsckobjects=false https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
Plugin 'mileszs/ack.vim'

" Syntax checker
Plugin 'scrooloose/syntastic'

" Easy motion
Plugin 'easymotion/vim-easymotion'

" fzf for vim
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Better swap file handling
Plugin 'gioele/vim-autoswap'

" Code formatting
Plugin 'sbdchd/neoformat'

" Easy Align
Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" robotframework
Plugin 'mfukar/robotframework-vim'
Plugin 'evedovelli/rst-robotframework-syntax-vim'

" PEP8 checker
Plugin 'nvie/vim-flake8'

" Markdown preview
Plugin 'iamcco/markdown-preview.nvim'

" Hashicorp Terraform syntax support
Plugin 'hashivim/vim-terraform'

call vundle#end()
filetype plugin indent on
" Show command
set showcmd

" Markdown support
"let g:markdown_fenced_languages = ['html', 'javascript', 'bash=sh']

" Treat *.dockerfile files as dockerfile syntax
au BufNewFile,BufFilePre,BufRead *.dockerfile set filetype=dockerfile

au BufNewFile,BufFilePre,BufRead *.bashrc set filetype=sh
au BufNewFile,BufFilePre,BufRead *.env.local set filetype=sh

" Security concerns and useless anyway
set modelines=0

" LEADER SHORTCUTS
let mapleader = " "

" Quit
nnoremap <LEADER>q :q<CR>
" Save current buffer
nnoremap <LEADER>w :w<CR>
" Save and Exit
nnoremap <LEADER>x :x<CR>
" Select everything
nnoremap <LEADER>v V`]
" Clear search highlight
nnoremap <LEADER>, :noh<CR>
" Toggle NERDTree panel
nnoremap <LEADER>n :NERDTreeToggle<CR>
" Set to Background
nnoremap <LEADER>z <C-z>
" Edit my vimrc
nnoremap <LEADER>ev :e $MYVIMRC<CR>
" Refresh vim config from ~/.vimrc
nnoremap <LEADER>sv :source ~/.vimrc<CR>
" Edit vimrc in a vertical split
nnoremap <leader>ev :vsplit ~/.vimrc<CR>

" Tab movement
nnoremap <F2> :tabp<CR>
nnoremap <F3> :tabn<CR>

" Move around windows
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER><Left> <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER><Down> <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER><Up> <C-w>k
nnoremap <LEADER>l <C-w>l
nnoremap <LEADER><Right> <C-w>l

" Activate robotframework sytax highlighting
noremap <F12> :setf robot<CR>

" Use Markdown plugin
nnoremap <LEADER>m :MarkdownPreview<CR>
nnoremap <LEADER>ms :MarkdownPreviewStop<CR>


" If no file required at CLI invoke, open with NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | wincmd w | q | endif

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
"autocmd FileType nerdtree setlocal relativenumber

" enable hidden files display
let NERDTreeShowHidden=1

" Display trailing spaces and other stuff
set listchars=tab:\ \ ,trail:~,extends:>,precedes:<,nbsp:⎵
set list

" Automatically refresh buffer on external changes
" For the CursorHold see
" [here](https://superuser.com/a/1090762)
set autoread
au CursorHold * checktime


" Easymotion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Open files of location/quickfix lists in new tabs instead of in the current
" buffer
set switchbuf+=newtab

" Vim markdown preview parameters
let vim_markdown_preview_browser='Mozilla Firefox'
let vim_markdown_preview_github=1

" Indent setup
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent

" File search
set wildmenu
set wildmode=list:longest
set wildignore+=node_modules/*,bower_components/*

" Misc
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set showmatch
set hidden
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set ruler

set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch


" Always display status line
set laststatus=2

" Change to uppercase, lowercase and titlecase
function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
      let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
      let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
      let result = toupper(a:str)
    endif
    return result
endfunction
vnoremap <LEADER>u y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

function! CustomBranchName(name)
  return fnamemodify(a:name, ':t')[0:10]
endfunction
let g:airline#extensions#branch#format = 'CustomBranchName'

" Display line number relative to the current one
"set relativenumber

" YouCompleteMe Fix
let g:ycm_server_python_interpreter="/usr/bin/python3"

" Centralize all vim temp files in home folder
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo
set writebackup
set backupcopy=yes

" Ensure title and titlestring variables are set to default for autoswap
set title titlestring=

" Automatically refresh buffer on external changes
" For the CursorHold see
" [here](https://superuser.com/a/1090762)
set autoread
au CursorHold * checktime

" Wait x milliseconds of inactivity to write the current buffer into a swap
" file, and to trigger CursorHold a event.
set updatetime=2000

" Syntastic options
" Customize status line with syntastic errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { "mode": "passive" }

" Undo info available across vim instances
set undofile

" Enable spell checking with default english dictionnary
autocmd FileType markdown setlocal spell spelllang=en

syntax enable
