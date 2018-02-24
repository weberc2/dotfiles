"=============================================================================
" FILE: deoplete.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

function! deoplete#initialize() abort "{{{
  return deoplete#init#_initialize()
endfunction"}}}
function! deoplete#enable() abort "{{{
  call deoplete#init#_initialize()
  return deoplete#init#_enable()
endfunction"}}}
function! deoplete#disable() abort "{{{
  return deoplete#init#_disable()
endfunction"}}}
function! deoplete#toggle() abort "{{{
  return deoplete#init#_is_enabled() ?
        \ deoplete#disable() : deoplete#enable()
endfunction"}}}

function! deoplete#enable_logging(level, logfile) abort "{{{
  " Enable to allow logging before completions start.
  call deoplete#init#_initialize()

  call rpcrequest(g:deoplete#_channel_id,
        \ 'deoplete_enable_logging', a:level, a:logfile)
endfunction"}}}

" vim: foldmethod=marker
