---@type LazySpec
return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = { 'nvim-lua/plenary.nvim' },

	keys = {
		{ '<C-p>',      ':Telescope find_files<cr>' },
		{ '<leader>ff', ':Telescope find_files<cr>' },
		{ '<leader>fg', ':Telescope live_grep<cr>' },
		{ '<leader>fh', ':Telescope help_tags<cr>' },
		{ '<leader>fb', ':Telescope buffers<cr>' },
	},

	opts = {
		pickers = {
			find_files = {
				-- https://www.reddit.com/r/neovim/comments/nspg8o/comment/h0owlue/
				find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
			}
		}
	},

	config = function(_, opts)
		require('telescope').setup(opts)

		-- quick access nvim configs from any location
		vim.keymap.set('n', '<leader>nv', function()
			require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })
		end)
	end
}
