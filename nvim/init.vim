call plug#begin('~/.config/nvim/bundle')
Plug 'fatih/vim-go'
Plug 'altercation/vim-colors-solarized'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
" Plug 'reasonml/vim-reason'
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
call plug#end()

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" Fix tabs
set tabstop=4
set shiftwidth=4
set expandtab
set ru nu

" CoffeeScript uses 2 spaces (presumably for obfuscation?)
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2

" Enable solarized theme
syntax enable
set background=light
colorscheme solarized

" Highlight and strip (on save) trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

execute pathogen#infect()
syntax on
filetype plugin indent on

 " python support (this lets neovim run plugins written in python)
let g:python3_host_prog = '/usr/local/bin/python3.6'

" highlight column 80
set colorcolumn=80

" RustFmt on save
let g:rustfmt_autosave = 1

" FZF
set splitright
let g:fzf_action = {
  \ 'enter': 'vsplit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split' }
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'down': '~40%' }
nnoremap <c-p> :FZF<cr>

" A recent upgrade to neovim seems to have changed the default mouse scrolling
" behavior (scrolling in vim vs scrolling through my terminal's buffer)
set mouse=a

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3.6'
let g:syntastic_enable_racket_racket_checker = 1
function Py2()
  let g:syntastic_python_python_exec = '/usr/local/bin/python2.7'
endfunction
