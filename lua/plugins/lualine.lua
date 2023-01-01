-- list of pre-packaged lualine themes
-- NOTE: certain lualine default themes are exculded for
-- improved asthetic changes
local lualine_def_themes = {
	'16color',
	'ayu_dark',
	'ayu_light',
	'ayu_mirage',
	'codedark',
	'dracula',
	'gruvbox',
	'gruvbox_light',
	'gurvbox_material',
	'horizon',
	'iceberg_dark',
	'iceberg_light',
	'jellybeans',
	'material',
	'modeus_vivendi',
	'molokai',
	'nightfly',
	'nord',
	'oceanicnext',
    'ondedark',
	'onelight',
	'palenight',
	'papercolor_dark',
	'papercolor_light',
	'powerline',
	'seoul256',
	'solarized_dark',
	'solarized_light',
	'tommorow',
	'wombat',
	'oxocarbon',
}

-- initialize vars for schemes
local lualine_theme = vim.g.colors_name or 'oxocarbon'

local is_lualine_default = false	
for i, name in ipairs(lualine_def_themes) do
    if name == theme_name then
        is_lualine_default = true
    end
end

-- if a scheme is not bundled with lualine, look for a theme file
if is_lualine_default == false then
	lualine_theme = require('themes.lualine.' .. lualine_theme)
else
	lualine_theme = 'everforest'
end

local lualine_style = { '', '' }
local lualine_seperator = { '', '' }

-- lualine setup config
require('lualine').setup({
	options = {
		section_separators = lualine_style,
		component_separators = lualine_seperator,
		theme = lualine_theme,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
})
