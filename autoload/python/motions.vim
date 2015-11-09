" vim:fdm=marker
"
" Location: autoload/python/motions.vim
" Author: Pascal Lalancette (okcompute@icloud.com)

" Patterns {{{
let s:class_pattern = '^\s*class\s'
let s:function_pattern = '^\s*def\s'
let s:definition_pattern = '^\s*\(class\|def\)\s'

" }}}

" {{{

" Move the cursor position to the next pattern position
function! s:move_normal(pattern, direction)
    let flag = a:direction == 'backward' ? 'b' :''
    let repeat = v:count1 - 1
    let [line, column] = searchpos(a:pattern, flag.'sW')
    let indent = indent(line)
    while repeat && line
        let [line, column] = searchpos(a:pattern, flag.'W')
        if indent(line) == indent
            let repeat = repeat - 1
        endif
    endwhile
    call cursor(line)
    " Open the fold if there is any
    try
        normal zo
    catch
    endtry
    return [line, column]
endfunction


" Move cursor to the next pattern position while using visual mode.
function! s:move_visual(pattern, direction) range
    call cursor(a:lastline, 0)
    let end = s:move_normal(a:pattern, a:direction)
    call cursor(a:firstline, 0)
    normal! v
    call cursor(end)
endfunction

" }}}


" {{{

function! python#motions#move_to_class(mode, direction)
    call s:move_{a:mode}(s:class_pattern, a:direction)
endfunction

function! python#motions#move_to_function(mode, direction)
    call s:move_{a:mode}(s:function_pattern, a:direction)
endfunction

function! python#motions#move_to_definition(mode, direction)
    call s:move_{a:mode}(s:definition_pattern, a:direction)
endfunction

" }}}
