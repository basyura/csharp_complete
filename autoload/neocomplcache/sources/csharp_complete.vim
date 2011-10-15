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

let s:source = {
      \ 'name'     : 'csharp_complete'   ,
      \ 'kind'     : 'ftplugin' ,
      \ 'filetypes': {'cs' : 1 },
      \ }

function! s:source.initialize()
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

function! s:source.finalize()
endfunction

function! s:source.get_keyword_pos(cur_text)
  return matchend(a:cur_text, '^using\s\+')
endfunction

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)
  let space = ''
  let current = s:space_tree
  for v in split(a:cur_keyword_str, '\.')
    if !has_key(current, v)
      break
    endif
    let current = current[v]
    if space != '' | let space .= '.' | endif
    let space .= v
  endfor
  if space != '' | let space .= '.' | endif
  return map(keys(current), '{"word" : space . v:val}')
endfunction

function! neocomplcache#sources#csharp_complete#define()
  return s:source
endfunction

