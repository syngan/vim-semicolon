scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! semicolon#define(forward, back, flag, ...) abort " {{{
  let bang = a:0 > 0 ? a:1 : 1
  let normal = bang ? 'normal!' : 'normal'
  execute normal v:count1 . a:forward
  if a:flag || v:count1 > 1
    let b:semicolon_last_normal  = normal
    let b:semicolon_last_forward = a:forward
    let b:semicolon_last_back    = a:back
    let b:semicolon_last_count   = v:count1
  endif
endfunction " }}}

function! s:do(motion, cnt) abort " {{{
  execute b:semicolon_last_normal a:cnt . a:motion
  " should we update b:semicolon_last_count?
endfunction " }}}

function! semicolon#semicolon() abort " {{{
  if exists('b:semicolon_last_forward')
    call s:do(b:semicolon_last_forward, v:count1 * b:semicolon_last_count)
  endif
endfunction " }}}

function! semicolon#comma() abort " {{{
  if exists('b:semicolon_last_forward')
    call s:do(b:semicolon_last_back, v:count1 * b:semicolon_last_count)
  endif
endfunction " }}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et ts=2 sts=2 sw=2 tw=0:
