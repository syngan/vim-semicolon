scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! semicolon#define(forward, back, flag, ...) abort " {{{
  let bang = a:0 > 0 ? a:1 : 1
  let normal = bang ? 'normal!' : 'normal'
  execute normal v:count1 . a:forward
  if a:flag || v:count1 > 1
    let b:semicolon_last = {'normal': normal, 'next': a:forward, 'prev': a:back, 'count': v:count1}
  endif
endfunction " }}}

function! s:do(motion, cnt, idx) abort " {{{
  let c = (b:semicolon_last.count * a:cnt)
  let motion = c . b:semicolon_last[a:motion]
  if has_key(b:semicolon_last, 'unmap')
    let u = b:semicolon_last.unmap[a:idx]
    execute 'nunmap' '<buffer>' u[0]
    try
      execute b:semicolon_last.normal motion
    finally
      execute 'nmap' '<buffer>' '<silent>' '<nowait>' u[0] u[1]
    endtry
  else
    execute b:semicolon_last.normal motion
    let u = 'none'
  endif

  " should we update b:semicolon_last.count?
endfunction " }}}

function! semicolon#semicolon() abort " {{{
  if exists('b:semicolon_last')
    call s:do('next', v:count1, 0)
  endif
endfunction " }}}

function! semicolon#comma() abort " {{{
  if exists('b:semicolon_last')
    call s:do('prev', v:count1, 1)
  endif
endfunction " }}}

function! semicolon#bracket(next, prev) abort " {{{
  let c = getchar()
  if type(c) == type(0)
    let c = nr2char(c)
  endif
  let motion = a:next . c

  let pos = getpos('.')
  execute 'nunmap' '<buffer>' a:next
  try
    execute 'normal' v:count1 . motion
  finally
    if a:next ==# ']'
      nmap <silent> <buffer> <nowait> ] <Plug>(semicolon-bracket-next)
    else
      nmap <silent> <buffer> <nowait> [ <Plug>(semicolon-bracket-prev)
    endif
  endtry
  if pos != getpos('.')
    " うごいた!
    let b:semicolon_last = {'normal': 'normal', 'next': motion, 'prev': a:prev . c, 'count': v:count1}
    let u = [
          \ [']', '<Plug>(semicolon-bracket-next)'],
          \ ['[', '<Plug>(semicolon-bracket-prev)']]
    if a:next == '['
      let b:semicolon_last.unmap = [u[1],u[0]]
    else
      let b:semicolon_last.unmap = u
    endif
  endif
endfunction " }}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et ts=2 sts=2 sw=2 tw=0:
