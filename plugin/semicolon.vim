let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> <Plug>(semicolon-forward) :<C-u>call semicolon#semicolon()<CR>
nnoremap <silent> <Plug>(semicolon-back)    :<C-u>call semicolon#comma()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et ts=2 sts=2 sw=2 tw=0:
