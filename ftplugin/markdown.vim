set spell
set linebreak
set wrap

function! MarkdownLevel()
  let h = matchstr(getline(v:lnum), '^#\+\s')
  if empty(h)
    return "="
  else
    return ">" . len(h)
  endif
endfunction

setlocal foldexpr=MarkdownLevel()
setlocal foldmethod=expr

nnoremap <C-n> /^#\+\s<enter>:nohl<enter>
nnoremap <C-p> ?^#\+\s<enter>:nohl<enter>
