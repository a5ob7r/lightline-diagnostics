if exists('g:loaded_lightline_diagnostics')
  finish
endif

let g:loaded_lightline_diagnostics = 1

let s:save_cpo = &cpo
set cpo&vim

augroup lightline-diagnostics
  autocmd!

  autocmd User LspDiagsUpdated call lightline#diagnostics#lsp_vim9#update_counts()
  autocmd User LspDiagsUpdated call lightline#update()

  autocmd User ALELintPost,ALEFixPost call lightline#diagnostics#ale#update_counts()
  autocmd User ALELintPost,ALEFixPost call lightline#update()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set expandtab tabstop=2 shiftwidth=2 foldmethod=marker:
