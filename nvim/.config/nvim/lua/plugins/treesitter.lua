---@type LazySpec
return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	dependencies = {
		'MeanderingProgrammer/treesitter-modules.nvim',
		opts = {
			auto_install = true,
			highlight = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = ']v',
					node_incremental = ']v',
					node_decremental = '[v'
				}
			}
		}
	}
}
