set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Pathogen
" execute pathogen#infect()
" call pathogen#helptags() " generate helptags for everything in ‘runtimepath’
Plugin 'tpope/vim-fugitive'
Plugin 'YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
Plugin 'geekjuice/vim-spec'
Plugin 'benmills/vimux'
Plugin 'mhinz/vim-signify'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'vim-ruby/vim-ruby'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'prettier/vim-prettier'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" " Rubocop plugin specifying where to get rubocop rules from
let g:vimrubocop_config = '.rubocop.yml'
call vundle#end()
syntax on
filetype plugin indent on
set foldlevel=20
set tags=./.tags;
set ruler
let g:easytags_dynamic_files=1
set list
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set statusline+=%f
set laststatus=2
set backspace=2
set expandtab
set tabstop=2
set shiftwidth=2
set runtimepath^=~/.vim/bundle/ctrlp.vim
let mapleader = ","
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 50
nnoremap <leader>nn :NERDTree<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
set runtimepath^=~/.vim/bundle/ag
set noswapfile
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
filetype plugin on

nmap gr :CtrlPMRU<CR>
nmap go :CtrlP<CR>
nmap gu :CtrlPBuffer<CR>
nmap gb :CtrlPBuffer<CR>

nmap <leader>ev :e ~/.vimrc<CR>
nmap <leader>re :source ~/.vimrc<CR>

nnoremap <Leader>, <esc>V:s/,/\r/g<cr>

nmap <space> :w<CR>
" ----------------------------------------------------------------------------
"  " Vim Spec
"  "
"  ----------------------------------------------------------------------------
let g:rspec_command = ":call VimuxRunCommand('clear; bundle exec rspec {spec}')"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>f :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

nmap <leader>r :VimuxRunCommand('clear; rubocop ' . expand('%:p'))<CR>
nmap <leader>c :VimuxRunCommand('clear; rubocop')<CR>
set undofile
set undodir=~/.vim/undo
function! StripWhitespace ()
  exec ':%s/ \+$//gc'
endfunction
nmap <leader><leader>st :call StripWhitespace ()<CR>
set nu

" ---------------------------------------------------------------------------
" Window Management
" ---------------------------------------------------------------------------
" opening and switching
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" mappings to make window management easy
set winminheight=0
nnoremap gz :wincmd _<cr>

" window navigation
nnoremap g<left> :call WinMove('h')<cr>
nnoremap g<right> :call WinMove('l')<cr>
nnoremap g<down> :call WinMove('j')<cr>
nnoremap g<up> :call WinMove('k')<cr>
inoremap jj <ESC>
nmap <C-a> ggVG
"Add the pry debug line with \bp
map <Leader>bp Orequire'pry';binding.pry<esc>:w<cr>
"Add erb <%= %> with ,<
map <Leader>< <esc>a<%=   %><esc>bhhha
" ----------------------------------------------------------------------------
" easymotion
" ----------------------------------------------------------------------------
" let g:EasyMotion_leader_key = '<space>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
" let g:EasyMotion_do_mapping = 1 " Disable default mappings

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
nmap f <Plug>(easymotion-bd-f)
omap f <Plug>(easymotion-bd-f)

nmap t <Plug>(easymotion-bd-t)
omap t <Plug>(easymotion-bd-t)

nmap s <Plug>(easymotion-bd-f)
omap s <Plug>(easymotion-bd-f)

" replace incremental search
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-sn)
" extend n/N with more features like auto-highlight
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" ---------------------------------------------------------------------------
" mappings
" ---------------------------------------------------------------------------
" make selecting a line easier
nnoremap vv V
