---@type LazySpec
return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	dependencies = {
		'MeanderingProgrammer/treesitter-modules.nvim',
		opts = {
			auto_install = true,
			highlight = { enable = true }
		}
	}
}
