let s:lightline_diagnostics_infos_indicator_prefix = get(g:, 'lightline_diagnostics_infos_indicator_prefix', 'I: ')
let s:lightline_diagnostics_hints_indicator_prefix = get(g:, 'lightline_diagnostics_hints_indicator_prefix', 'H: ')
let s:lightline_diagnostics_warns_indicator_prefix = get(g:, 'lightline_diagnostics_warns_indicator_prefix', 'W: ')
let s:lightline_diagnostics_errors_indicator_prefix = get(g:, 'lightline_diagnostics_errors_indicator_prefix', 'E: ')
let s:lightline_diagnostics_ok_indicator = get(g:, 'lightline_diagnostics_ok_indicator', 'OK')

function! lightline#diagnostics#infos() abort
  const l:infos_count = s:infos_count() ?? 0

  return l:infos_count == 0 ? '' : s:lightline_diagnostics_infos_indicator_prefix . l:infos_count
endfunction

function! lightline#diagnostics#hints() abort
  const l:hints_count = s:hitns_count() ?? 0

  return l:hints_count == 0 ? '' : s:lightline_diagnostics_hints_indicator_prefix . l:hints_count
endfunction

function! lightline#diagnostics#warns() abort
  const l:warns_count = s:warns_count() ?? 0

  return l:warns_count == 0 ? '' : s:lightline_diagnostics_warns_indicator_prefix . l:warns_count
endfunction

function! lightline#diagnostics#errors() abort
  const l:errors_count = s:errors_count() ?? 0

  return l:errors_count == 0 ? '' : s:lightline_diagnostics_errors_indicator_prefix . l:errors_count
endfunction

function! lightline#diagnostics#ok() abort
  const l:total_count = s:total_count() ?? 0

  return l:total_count == 0 ? s:lightline_diagnostics_ok_indicator : ''
endfunction

function! s:infos_count() abort
  return lightline#diagnostics#lsp_vim9#infos_count() + lightline#diagnostics#ale#infos_count()
endfunction

function! s:hints_count() abort
  return lightline#diagnostics#lsp_vim9#hints_count() + lightline#diagnostics#ale#hints_count()
endfunction

function! s:warns_count() abort
  return lightline#diagnostics#lsp_vim9#warns_count() + lightline#diagnostics#ale#warns_count()
endfunction

function! s:errors_count() abort
  return lightline#diagnostics#lsp_vim9#errors_count() + lightline#diagnostics#ale#errors_count()
endfunction

function! s:total_count() abort
  return lightline#diagnostics#lsp_vim9#total_count() + lightline#diagnostics#ale#total_count()
endfunction

" vim: set expandtab tabstop=2 shiftwidth=2 foldmethod=marker:
