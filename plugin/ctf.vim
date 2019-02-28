func! s:CodeTraceFormat(type)
    echoerr "CTF"
    let s:line_idx = 0
    "
    let s:indented_line_num = 0
    let l:begin = line("'<'")
    let l:end = line("'>")
    if a:type == "fmt"
        "TODO: make it variable
        let s:offset_base = 2
    elseif a:type == "unfmt"
        let s:offset_base = 0
    endif
    let s:offset = 0
    let s:cmd = ""

    if l:begin > l:end
        let l:tmp = l:begin
        let l:begin = l:end
        let l:end = l:tmp
    endif

    let s:line_idx = l:begin
    while s:line_idx <= l:end
        let current_line = getline(s:idx)
        if !empty(current_line)
            let s:offset = s:offset_base * s:indented_line_num
            let s:cmd = string(s:idx)." le ".string(s:offset)
            exe s:cmd
            let s:indented_line_numl +=1
        endif
        let s:line_idx += 1
    endwhile
endfunc

"vnoremap       <expr> <Plug>VisualFormat    <SID>VisualToFormat()
"vmap <leader>s <Plug>VisualFormat <CR>
vnoremap <leader>ff :<C-U>call <SID>CodeTraceFormat("fmt")<CR>
vnoremap <leader>fu :<C-U>call <SID>CodeTraceFormat("unfmt")<CR>
