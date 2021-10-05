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


-- Load All packer
require('plug')

-- load keybindings and editor options
require('keymap')
require('options')

-- load theme loading library
local scheme = require('lib.scheme')

-- Load Themes (loads everforest theme by default)
-- load editor color theme
-- scheme.load_scheme('everforest')

-- load statusline theme
-- scheme.load_lualine_scheme('everforest')

-- if you don't  want to specify the theme for each component,
-- you can use the following function
scheme.load_shared_scheme('onedark')

-- TODO: Investigate if this loads all plugins at once
--       should implement lazy loading to only load when required
-- load configurations
-- config.plug loads plugin configurations
-- config.module loads user contrib files (work in progress)
require('plugins')
-- idk what plugins are so they are disabled for now
-- require('config.modules')

-- loads all lsp-config configurations in lua/lsp/*
require('lsp')

