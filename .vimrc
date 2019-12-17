set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Best status bar ever
Plugin 'vim-airline/vim-airline'

" Git Integration
Plugin 'tpope/vim-fugitive'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" robotframework 
Plugin 'mfukar/robotframework-vim'

" PEP8 checker
Plugin 'nvie/vim-flake8'

" Easy motion
Plugin 'easymotion/vim-easymotion'

" Surrounding plugin (to add quotes/parens/brackets around stuff)
Plugin 'tpope/vim-surround'

" Ack support
" Beware ! git.fsck might not like this plugin. Use manual install if needed:
" git clone --config transfer.fsckobjects=false https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
Plugin 'mileszs/ack.vim'



call vundle#end()
filetype plugin indent on
" If no file required at CLI invoke, open with NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show command
set showcmd

" LEADER SHORTCUTS
let mapleader = " "

" Quit
nnoremap <LEADER>q :q<CR>
" Select everything
nnoremap <LEADER>v V`]
" Clear search highlight
nnoremap <LEADER>, :noh<CR>
" Save current buffer
nnoremap <LEADER>w :w<CR>
" Toggle NERDTree panel
nnoremap <LEADER>n :NERDTreeToggle<CR>

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

syntax enable
