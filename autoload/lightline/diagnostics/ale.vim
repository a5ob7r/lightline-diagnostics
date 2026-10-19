let s:save_cpo = &cpo
set cpo&vim

function! lightline#diagnostics#ale#infos_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_ale_counts['info'] : v:null
endfunction

function! lightline#diagnostics#ale#hints_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_ale_counts['hint'] : v:null
endfunction

function! lightline#diagnostics#ale#warns_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_ale_counts['warn'] : v:null
endfunction

function! lightline#diagnostics#ale#errors_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_ale_counts['error'] : v:null
endfunction

function! lightline#diagnostics#ale#total_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_ale_counts['info'] + b:lightline_diagnostics_ale_counts['hint'] + b:lightline_diagnostics_ale_counts['warn'] + b:lightline_diagnostics_ale_counts['error'] : v:null
endfunction

function! lightline#diagnostics#ale#update_counts() abort
  const l:count = ale#statusline#Count(bufnr())

  " ALE does not provide diagnostics at hint level.
  let b:lightline_diagnostics_ale_counts = #{
  \   info: l:count['info'],
  \   hint: 0,
  \   warn: l:count['warning'] + l:count['style_warning'],
  \   error: l:count['error'] + l:count['style_error']
  \ }
endfunction

function! s:diagnosticed() abort
  return s:enabled() && exists('b:lightline_diagnostics_ale_counts')
endfunction

function! s:enabled() abort
  return get(b:, 'ale_enabled', get(g:, 'ale_enabled'))
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set expandtab tabstop=2 shiftwidth=2 foldmethod=marker:
