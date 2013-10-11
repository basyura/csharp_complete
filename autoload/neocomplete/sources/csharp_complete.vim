" this file's path
let s:script_path = expand("<sfile>:p:h")
" s:space_tree = {
"    ┌ System ┬ Activities  ─ ・・・
"    │        └ Collections ┬ Concurrent
"    │                       └ Generic
"    ├ Microsoft
"    ├ UIAutomationClientsideProviders
"    └ XamlGeneratedNamespace
" }
let s:space_tree = {}
"
let s:source = {
      \ 'name'     : 'csharp_complete',
      \ 'rank'     : 200,
      \ 'kind'     : 'manual',
      \ 'filetypes': {'cs' : 1 },
      \ 'hooks'    : {},
      \ }
"
" initialize
" create name spaces tree by text file.
"
function! s:source.hooks.on_init(context)
  let space_tree = {}
  for val in readfile(s:script_path . '/../../../lib/name_spaces.txt')
    let current = space_tree
    for space in split(val, '\.')
      if !has_key(current, space)
        let current[space] = {}
      endif
      let current = current[space]
    endfor
  endfor
  let s:space_tree = space_tree
endfunction
"
function! s:source.get_complete_position(context)
  if getline(".") !~ '^using'
    return -1
  endif

  let pos = 0
  while 1
    let tmp = matchend(a:context.input, '\.', pos)
    if tmp < 0
      break
    else
      let pos = tmp
    endif
  endwhile
  " find last . position
  if pos > 0
    return pos
  endif

  return matchend(a:context.input, '^using\s\+')
endfunction
"
function! s:source.gather_candidates(context)
  if getline(".") =~ '^using'
    return s:get_using_complete_words(a:context.complete_pos, a:context.input)
  endif

  return []
endfunction
"
" get name spaces
"
function! s:get_using_complete_words(pos, text)
  let space = ''
  let current = s:space_tree
  for v in split(substitute(a:text, 'using\s\+', '', ''), '\.')
    if !has_key(current, v)
      break
    endif
    let current = current[v]
    let space .= v
  endfor
  
  let candidates = map(keys(current), '{"word" : v:val}')

  return candidates
endfunction
"
function! neocomplete#sources#csharp_complete#define()
  return s:source
endfunction

