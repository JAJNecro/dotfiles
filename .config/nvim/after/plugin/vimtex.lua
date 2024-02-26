vim.cmd[[
let g:Tex_IgnoredWarnings = 
\'Underfull'."\n".
\'Overfull'."\n".
\'specifier changed to'."\n".
\'You have requested'."\n".
\'Missing number, treated as zero.'."\n".
\'There were undefined references'."\n".
\'LaTeX Font Warning:'."\n".
\'Citation %.%# undefined'
let g:Tex_IgnoreLevel = 8
  let g:vimtex_quickfix_ignore_filters = [
  \'Underfull',
  \'Overfull',
  \'LaTeX Font Warning:',
  \]
]]
