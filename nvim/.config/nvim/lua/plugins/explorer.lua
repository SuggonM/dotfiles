---@type LazySpec
return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		'nvim-tree/nvim-web-devicons'
	},
	lazy = false,
	-- load "slow" to prevent others from overriding neotree keybind
	priority = -1,

	keys = {
		{ '<leader>e', vim.cmd.Neotree }
	},
	opts = {
		close_if_last_window = true,
		source_selector = { winbar = true },
		window = {
			position = 'right',
			width = '25%'
		},
		filesystem = {
			hijack_netrw_behavior = 'open_current',
			filtered_items = {
				visible = true,
				never_show = { '.git' }
			},
			follow_current_file = { enabled = true }
		},
		default_component_configs = {
			name = { trailing_slash = true }
		}
	}
}
