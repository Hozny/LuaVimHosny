-- Things to do for the nvim config
-- TODO: 
-- [] Add visual mode commands to which-key
-- [] Add Harpoon file navigation
-- [] Add git diff / better git control
-- [] Add browsing remote github repos
-- [] Figure out lazy loading of plugins (get load time <100)
-- [] Add something to change between copy modes (switch between system clipboard and internal clipboard)
--      - [] add indicator to statusline
-- [] Add visual for trailing whitespace

local theme = 'gruvbox'

vim.cmd("colorscheme " .. theme)

require('themes')

-- Load All packer
require('plug')

-- load keybindings and editor options
require('keymap')
require('options')

-- load configurations
-- config.plug loads plugin configurations
-- config.module loads user contrib files (work in progress)
require('plugins')
-- loads all lsp-config configurations in lua/lsp/*
require('lsp')

