" vim:fdm=marker
"
" Location: ftplugin/python/motions.vim
" Author: Pascal Lalancette (okcompute@icloud.com)

nnoremap <buffer> ]C  :<C-U>call python#motions#move_to_class('normal', 'foward')<CR>
nnoremap <buffer> [C  :<C-U>call python#motions#move_to_class('normal', 'backward')<CR>
nnoremap <buffer> ]M  :<C-U>call python#motions#move_to_function('normal', 'foward')<CR>
nnoremap <buffer> [M  :<C-U>call python#motions#move_to_function('normal', 'backward')<CR>
nnoremap <buffer> ]]  :<C-U>call python#motions#move_to_definition('normal','foward')<CR>
nnoremap <buffer> [[  :<C-U>call python#motions#move_to_definition('normal','backward')<CR>

onoremap <buffer> ]C  :<C-U>call python#motions#move_to_class('normal', 'foward')<CR>
onoremap <buffer> [C  :<C-U>call python#motions#move_to_class('normal', 'backward')<CR>
onoremap <buffer> ]M  :<C-U>call python#motions#move_to_function('normal', 'foward')<CR>
onoremap <buffer> [M  :<C-U>call python#motions#move_to_function('normal', 'backward')<CR>
onoremap <buffer> ]]  :<C-U>call python#motions#move_to_definition('normal','foward')<CR>
onoremap <buffer> [[  :<C-U>call python#motions#move_to_definition('normal','backward')<CR>

vnoremap <buffer> ]C  :<C-U>call python#motions#move_to_class('visual', 'foward')<CR>
vnoremap <buffer> [C  :<C-U>call python#motions#move_to_class('visual', 'backward')<CR>
vnoremap <buffer> ]M  :<C-U>call python#motions#move_to_function('visual', 'foward')<CR>
vnoremap <buffer> [M  :<C-U>call python#motions#move_to_function('visual', 'backward')<CR>
vnoremap <buffer> ]]  :<C-U>call python#motions#move_to_definition('visual','foward')<CR>
vnoremap <buffer> [[  :<C-U>call python#motions#move_to_definition('visual','backward')<CR>
