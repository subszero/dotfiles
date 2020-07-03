" Register Rust tasks {{{1
function! s:cargo_tasks() abort
  if filereadable('Cargo.toml')
    let commands = ['build', 'run', 'test', 'fmt']
    let conf = {}
    for cmd in commands
      call extend(conf, {
            \ cmd : {
              \ 'command': 'cargo',
              \ 'args' : [cmd],
              \ 'isDetected' : 1,
              \ 'detectedName' : 'cargo: '
            \ }
          \ })
    endfor
    return conf
  else
    return {}
  endif
endfunction
" }}}1

" Register make tasks {{{1
function! s:make_tasks() abort
  if filereadable('Makefile')
    let commands = filter(readfile('Makefile', ''), "v:val=~#'^.PHONY'")
    if !empty(commands)
      call flatten(map(commands, {k, v -> split(v)[1:]}))
      let conf = {}
      for cmd in commands
        call extend(conf, {
              \ cmd: {
                \ 'command': 'make',
                \ 'args': [cmd],
                \ 'isDetected' : 1,
                \ 'detectedName' : 'make: '
              \ }
            \ })
      endfor
      return conf
    else
      return {}
    endif
  else
    return {}
  endif
endfunction
" }}}1

" Called after custom config is loaded
function! myspacevim#before() abort
  " Configure tasks
  call SpaceVim#plugins#tasks#reg_provider(funcref('s:make_tasks'))
  call SpaceVim#plugins#tasks#reg_provider(funcref('s:cargo_tasks'))

  " Configure custom shortcuts
  call SpaceVim#custom#SPC('nore', ['r', 'w'], "for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor", "wipe all registers", 1)
  call SpaceVim#custom#SPC('nore', ['g', 'p'], "Gina patch", "interactively-stage-file", 1)
endfunction

" Called after entering autocmd mode
function! myspacevim#after() abort
  " Set text width to 100
  set tw=100
  set colorcolumn=+1

  " Prevent vimtex preview
  let g:tex_conceal = ""

  " Open new windows at the bottom and right
  set splitbelow splitright

  if has('nvim')
    " Show result of substitution commands
    set inccommand=nosplit
  endif

  " Highlight changes in diff mode
  if &diff
    highlight! link DiffText MatchParen
  endif
endfunction

" vim:set fdm=marker:
