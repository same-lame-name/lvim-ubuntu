vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd BufWinEnter * :set formatoptions-=cro
  augroup end
]])


