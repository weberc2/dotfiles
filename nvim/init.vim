call plug#begin()
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
call plug#end()

" Set the background
set background=light

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility remove
" change the following statements
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

" Highlight and strip (on save) trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e

" highlight column 81 (6 is dark cyan; see `:help ctermbg` for details)
set colorcolumn=81
highlight ColorColumn ctermbg=6

" automatic word wrapping at 80 characters
set textwidth=80
set fo+=a
