---@type LazySpec
return {
	'lewis6991/gitsigns.nvim',

	lazy = false,
	keys = {
		{ '<leader>ga', ':Gitsigns stage_buffer<cr>'  },
		{ '<leader>gh', ':Gitsigns stage_hunk<cr>', mode = { 'n', 'x' }},
		{ '<leader>gp', ':Gitsigns preview_hunk<cr>'  },
		{ '<leader>gv', ':Gitsigns select_hunk<cr>'   },
		{ '[g', ':Gitsigns nav_hunk prev<cr>' },
		{ ']g', ':Gitsigns nav_hunk next<cr>' }
	},

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
			vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#ffb000' })
			vim.api.nvim_set_hl(0, 'GitSignsAddLnInline', { bg = '#004000' })
			vim.api.nvim_set_hl(0, 'GitSignsDeleteLnInline', { bg = '#400000' })
			-- green (added) + red (deleted) = yellow (modified). beautiful, innit?
			vim.api.nvim_set_hl(0, 'GitSignsChangeInline', { bg = '#404000' })
		end
	}
}
