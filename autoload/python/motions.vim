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
    call cursor(line, column)
    " Open the fold if there is any
    try
        normal zo
    catch
    endtry
    return [line, column]
endfunction

" Move cursor to the next pattern position while using visual mode.
function! s:move_visual(pattern, direction) range
    let result = s:move_normal(a:pattern, a:direction)
    " Re-enable visual mode that was disabled by the mapping
    exec('normal! gv')
    "  Move cursor to search result if any
    if result[0] != 0
        call cursor(result)
    endif
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
