vim-semicolon
=====================

- Repeat latest motion [count] times.


# Example

```vim
nnoremap <silent> ;   :<C-u>call semicolon#semicolon()<CR>
nnoremap <silent> ,   :<C-u>call semicolon#comma()<CR>
" 3rd argument = 0: save only if v:count > 1 
nnoremap <silent> j   :<C-u>call semicolon#define('j', 'k', 0)<CR>
nnoremap <silent> k   :<C-u>call semicolon#define('k', 'j', 0)<CR>
" 3rd argument = 1: save always
nnoremap <silent> ]s  :<C-u>call semicolon#define(']s', '[s', 1)<CR>
nnoremap <silent> [s  :<C-u>call semicolon#define('[s', ']s', 1)<CR>
nnoremap <silent> ]c  :<C-u>call semicolon#define(']c', '[c', 1)<CR>
nnoremap <silent> [c  :<C-u>call semicolon#define('[c', ']c', 1)<CR>
```
