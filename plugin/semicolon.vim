let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> <Plug>(semicolon-forward) :<C-u>call semicolon#semicolon()<CR>
nnoremap <silent> <Plug>(semicolon-back)    :<C-u>call semicolon#comma()<CR>

nnoremap <Plug>(semicolon-bracket-next)    :<C-u>call semicolon#bracket(']', '[')<CR>
nnoremap <Plug>(semicolon-bracket-prev)    :<C-u>call semicolon#bracket('[', ']')<CR>

augroup augrp_semicolon
  autocmd!
  autocmd BufEnter * nmap <silent> <buffer> <nowait> ]   <Plug>(semicolon-bracket-next)
  autocmd BufEnter * nmap <silent> <buffer> <nowait> [   <Plug>(semicolon-bracket-prev)
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et ts=2 sts=2 sw=2 tw=0:
