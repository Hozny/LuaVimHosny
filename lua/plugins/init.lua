--[[
This init file loads all of the plugin configuration files
--]]

return {
	require('plugins.cmp'),
	require('plugins.lualine'),
	require('plugins.lspkind'),
	require('plugins.nvimtree'),
	require('plugins.gitsigns'),
	require('plugins.dashboard'),
	require('plugins.autopairs'),
	require('plugins.telescope'),
	require('plugins.bufferline'),
	require('plugins.nvim-comment'),
	require('plugins.nvim-colorizer'),
	require('plugins.nvim-treesitter'),
}
