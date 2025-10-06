return {
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup({
			pickers = {
				find_files = {
					-- https://www.reddit.com/r/neovim/comments/nspg8o/comment/h0owlue/
					find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
				}
			}
		})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<C-p>',      builtin.find_files)
		vim.keymap.set('n', '<leader>ff', builtin.find_files)
		vim.keymap.set('n', '<leader>fg', builtin.live_grep)
		vim.keymap.set('n', '<leader>fh', builtin.help_tags)

		-- quick access nvim configs from any location
		vim.keymap.set('n', '<leader>nv', function()
			builtin.find_files({ cwd = vim.fn.stdpath('config') })
		end)
	end
}
