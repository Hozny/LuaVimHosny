local colors = {
	base_fg = '#282828',
	light_fg = '#dde1e6',
	secondary = '#262626',
	background = '#262626',
	norm_bg = '#78a9ff',
	ins_bg = '#ee5396',
	vis_bg = '#be95ff',
	rep_bg = '#B16286',
	cmd_bg = '#689D6A',
	int_bg = '#928374',
}
--"#161616", "#262626", "#393939", "#525252", "#dde1e6", "#f2f4f8", "#ffffff", "#08bdba", "#3ddbd9", "#78a9ff", "#ee5396", "#33b1ff", "#ff7eb6", "#42be65", "#be95ff", "#82cfff", "#131313", "",

--LuaFormatter on
return {
	normal = {
		a = { bg = colors.norm_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	insert = {
		a = { bg = colors.ins_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	visual = {
		a = { bg = colors.vis_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	replace = {
		a = { bg = colors.rep_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	command = {
		a = { bg = colors.cmd_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
	inactive = {
		a = { bg = colors.int_bg, fg = colors.base_fg, gui = 'bold' },
		b = { bg = colors.secondary, fg = colors.light_fg },
		c = { bg = colors.background, fg = colors.light_fg },
	},
}
