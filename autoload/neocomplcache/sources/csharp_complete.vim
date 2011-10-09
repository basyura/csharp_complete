" this file's path
let s:script_path = expand("<sfile>:p:h")

let s:source = {
      \ 'name'     : 'csharp_complete'   ,
      \ 'kind'     : 'ftplugin' ,
      \ 'filetypes': {'cs' : 1 },
      \ }

function! s:source.initialize()
  let s:namce_spaces = readfile(s:script_path . '/../../../lib/name_spaces.txt')
endfunction

function! s:source.finalize()
endfunction

function! s:source.get_keyword_pos(cur_text)
  return matchend(a:cur_text, '^using\s\+')
endfunction

function! s:source.get_complete_words(cur_keyword_pos, cur_keyword_str)
  let list = []
  for v in s:namce_spaces
    let mc = matchstr(v , a:cur_keyword_str . '\a\+')
    if mc != ""
      call add(list, {'word' : mc})
    endif
  endfor
  return list
endfunction

function! neocomplcache#sources#csharp_complete#define()
  return s:source
endfunction

