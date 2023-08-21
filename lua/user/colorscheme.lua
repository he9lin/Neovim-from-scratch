vim.cmd [[
try
  colorscheme catppuccin-latte
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
