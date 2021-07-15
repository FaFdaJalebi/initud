lua require'initud'.initud()
augroup initud
  autocmd VimEnter    * nested call initud() 
augroup END
