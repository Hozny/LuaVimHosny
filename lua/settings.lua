local o = vim.o
local w = vim.wo
local b = vim.bo

vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
o.hidden = O.hidden_files -- Required to keep multiple buffers open multiple buffers

w.wrap = O.wrap_lines -- Display long lines as just one line
vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on') -- syntax highlighting
o.pumheight = 10 -- Makes popup menu smaller
o.fileencoding = "utf-8" -- The encoding written to file
o.cmdheight = 2 -- More space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
o.mouse = "a" -- Enable your mouse
o.splitbelow = true -- Horizontal splits will automatically be below
o.termguicolors = true -- set term gui colors most terminals support this
o.splitright = false -- Vertical splits will automatically be to the right
-- o.t_Co = "256" -- Support 256 colors
o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
b.smartindent = true -- Makes indenting smart
w.number = O.number -- set numbered lines
w.relativenumber = O.relative_number -- set relative number
w.cursorline = true -- Enable highlighting of the current line
--o.showtabline = 2 -- Always show tabs
--w.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.updatetime = 300 -- Faster completion
o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.cmd('colorscheme ' .. O.colorscheme)

