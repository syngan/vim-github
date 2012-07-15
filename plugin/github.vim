" An interface for Github.
" Version: 0.1.0
" Author : thinca <thinca+vim@gmail.com>
" License: zlib License

if exists('g:loaded_github')
  finish
endif
let g:loaded_github = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=+ -complete=customlist,github#complete
\        Github call github#invoke(<q-args>)


augroup plugin-github
  autocmd!
  autocmd BufReadCmd github://* call github#read(expand('<amatch>'))
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
