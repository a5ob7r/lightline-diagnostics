let s:save_cpo = &cpo
set cpo&vim

function! lightline#diagnostics#lsp_vim9#infos_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_lsp_vim9_counts['info'] : v:null
endfunction

function! lightline#diagnostics#lsp_vim9#hints_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_lsp_vim9_counts['hint'] : v:null
endfunction

function! lightline#diagnostics#lsp_vim9#warns_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_lsp_vim9_counts['warn'] : v:null
endfunction

function! lightline#diagnostics#lsp_vim9#errors_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_lsp_vim9_counts['error'] : v:null
endfunction

function! lightline#diagnostics#lsp_vim9#total_count() abort
  return s:diagnosticed() ? b:lightline_diagnostics_lsp_vim9_counts['info'] + b:lightline_diagnostics_lsp_vim9_counts['hint'] + b:lightline_diagnostics_lsp_vim9_counts['warn'] + b:lightline_diagnostics_lsp_vim9_counts['error'] : v:null
endfunction

function! lightline#diagnostics#lsp_vim9#update_counts() abort
  const l:count = lsp#lsp#ErrorCount()

  let b:lightline_diagnostics_lsp_vim9_counts = #{
  \   info: l:count['Info'],
  \   hint: l:count['Hint'],
  \   warn: l:count['Warn'],
  \   error: l:count['Error']
  \ }
endfunction

function! s:diagnosticed() abort
  return s:attached() && exists('b:lightline_diagnostics_lsp_vim9_counts')
endfunction

function! s:attached() abort
  return exists('*g:LspServerReady') && g:LspServerReady()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set expandtab tabstop=2 shiftwidth=2 foldmethod=marker:
