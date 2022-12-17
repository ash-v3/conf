function! myspacevim#before() abort
  set ignorecase
  set mouse=a
endfunction

function! myspacevim#after() abort
  set clipboard=unnamedplus
endfunction
