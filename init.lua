local o = vim.o
local w = vim.wo
local b = vim.bo

local utils = require('utils')

vim.g.mapleader = ';'

b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false

