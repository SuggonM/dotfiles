return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
		'nvim-tree/nvim-web-devicons'
	},
	lazy = false,

	config = function()
		vim.keymap.set('n', '<leader>e', function()
			vim.cmd('Neotree')
		end)

		require('neo-tree').setup({
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
		})
	end
}
