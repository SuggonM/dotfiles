---@type LazySpec
return {
	'm4xshen/autoclose.nvim',
	dependencies = {
		'windwp/nvim-ts-autotag',
		opts = {
			aliases = { mediawiki = 'html' }
		}
	},

	opts = {
		options = {
			disable_when_touch = true,
			pair_spaces = true
		},
		keys = {
			['>'] = { escape = false, close = false, pair = '><' },
			["'"] = { disable_command_mode = true },
			['"'] = { disable_command_mode = true }
		}
	}
}
