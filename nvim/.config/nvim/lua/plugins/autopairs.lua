---@type LazySpec
return {
	'm4xshen/autoclose.nvim',
	dependencies = {
		'windwp/nvim-ts-autotag',
		opts = {}
	},

	opts = {
		options = {
			disable_when_touch = true,
			pair_spaces = true
		}
	}
}
