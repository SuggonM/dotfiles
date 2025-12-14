return {
	'lewis6991/gitsigns.nvim',

	opts = {
		signs = {
			delete = { show_count = true }
		},
		count_chars = {
			'₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉',
			['+'] = '₊'
		},
		word_diff = true,
		attach_to_untracked = true,
		on_attach = function()
			local gitsigns = require('gitsigns')

			vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#005fff' })
			vim.api.nvim_set_hl(0, 'GitSignsAddLnInline', { bg = '#004000' })
			vim.api.nvim_set_hl(0, 'GitSignsDeleteLnInline', { bg = '#400000' })

			vim.keymap.set('n', '<leader>ga', gitsigns.stage_buffer)
			vim.keymap.set('n', '<leader>gh', gitsigns.stage_hunk)
			vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk)
			vim.keymap.set('n', '<leader>gv', gitsigns.select_hunk)
			vim.keymap.set('n', '<leader>g[', function() gitsigns.nav_hunk('prev') end)
			vim.keymap.set('n', '<leader>g]', function() gitsigns.nav_hunk('next') end)

			-- raw string because visual mode line nums can't be extracted easily
			vim.keymap.set('x', '<leader>gh', ':Gitsigns stage_hunk<CR>')
		end
	}
}
