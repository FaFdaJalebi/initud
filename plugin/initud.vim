let Initud = luaeval('require("initud").initud()')
augroup initud
  autocmd VimEnter    * nested call Initud() 
augroup END
