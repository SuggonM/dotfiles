---@type LazySpec
return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = { 'nvim-lua/plenary.nvim' },

	keys = function()
		local telescope = require('telescope.builtin')
		return {
			{ '<C-p>',      telescope.find_files },
			{ '<leader>ff', telescope.find_files },
			{ '<leader>fg', telescope.live_grep },
			{ '<leader>fh', telescope.help_tags },
			{ '<leader>fb', telescope.buffers },

			-- quick access nvim configs from any location
			{ '<leader>nv', function()
				telescope.find_files({ cwd = vim.fn.stdpath('config') })
			end }
		}
	end,

	opts = {
		pickers = {
			find_files = {
				-- https://www.reddit.com/r/neovim/comments/nspg8o/comment/h0owlue/
				find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
			}
		}
	}
}
