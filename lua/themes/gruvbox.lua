vim.opt.termguicolors = true
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
vim.cmd('hi GruvboxAquaSign guibg=NONE')
vim.cmd('hi GruvboxBlueSign guibg=NONE')
vim.cmd('hi GruvboxGreenSign guibg=NONE')

-- This is a janky fix.
-- Gruvbox_xx_Sign is set to the wrong colour for some reason
vim.cmd([[
augroup transparent_signs
  au!
  autocmd ColorScheme * highlight SignColumn guibg=NONE
  autocmd ColorScheme * highlight SignColumn guibg=NONE
  autocmd ColorScheme * highlight GruvboxAquaSign guibg=NONE')
  autocmd ColorScheme * highlight GruvboxBlueSign guibg=NONE')
  autocmd ColorScheme * highlight GruvboxGreenSign guibg=NONE')
  autocmd ColorScheme * highlight CursorLineNr guibg=NONE')
augroup END
]])
