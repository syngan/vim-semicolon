vim-semicolon
=====================

- Repeat latest motion [count] times.


# Example

```vim
nmap ;   <Plug>(semicolon-forward)
nmap ,   <Plug>(semicolon-back)

" 3rd argument = 0: save only if v:count > 1
" 3rd argument = 1: save always
nnoremap <silent> j   :<C-u>call semicolon#define('j', 'k', 0)<CR>
nnoremap <silent> k   :<C-u>call semicolon#define('k', 'j', 0)<CR>
```

keymap:

```
nmap <silent> <buffer> <nowait> ]   <Plug>(semicolon-bracket-next)
nmap <silent> <buffer> <nowait> [   <Plug>(semicolon-bracket-prev)
```
