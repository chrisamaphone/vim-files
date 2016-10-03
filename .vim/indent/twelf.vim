"if exists("b:did_indent")
    "finish
"endif
"let b:did_indent = 1

setlocal indentexpr=GetTwelfIndent()
setlocal indentkeys=o,O,0=<-,0=->,0<:>,!^F

"if exists("GetTwelfIndent")
    "finish
"endif

function! GetTwelfIndent()
    let lnum = line(".")

    if lnum == 0
        return 0
    endif

    let line = getline(lnum)

    let oparen_lnum = searchpair('(', '', ')', 'bW')
    if oparen_lnum > 0
        let oparen_line = iconv(getline(oparen_lnum), "utf-8", "latin1")
        let oparen_col = match(oparen_line, '([^()]*$')
        if oparen_col > 0
            let ind = oparen_col + 4
        endif

    elseif line =~ '^[^ :(){}.%[\]"]\+\s*:'
        return 0

    elseif line =~ '^\s*%'
        return indent(line)

    else
        " ought to fix this identifier pattern to be Twelf-manual-correct
        let declstart_lnum = searchpair('^[^ :(){}.%[\]"]\+\s*:', '', '\.$', 'bW')
        if declstart_lnum > 0
            let declstart_line = iconv(getline(declstart_lnum), "utf-8", "latin-1")
            let ind = stridx(declstart_line, ":") + 6
        endif
    endif

    if line =~ '^\s*\(<-\|->\)'
        let ind = ind - 3
    elseif line =~ '^\s*:'
        let ind = ind - 2
    end

    return ind

endfunction
