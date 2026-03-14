---@type LazySpec
return {
	'lewis6991/gitsigns.nvim',
	dependencies = {
		'kdheepak/lazygit.nvim'
	},

	lazy = false,
	keys = function()
		local gitsigns = require('gitsigns')
		local lazygit = require('lazygit')
		return {
			{ '<leader>gg', lazygit.lazygit },
			{ '<leader>ga', gitsigns.stage_buffer },
			{ '<leader>gh', gitsigns.stage_hunk },
			{ '<leader>gp', gitsigns.preview_hunk },
			{ '<leader>gv', gitsigns.select_hunk },
			{ '<leader>gr', gitsigns.reset_hunk },
			{ '[g', function() gitsigns.nav_hunk('prev') end },
			{ ']g', function() gitsigns.nav_hunk('next') end },

			-- behaves differently, cannot replicate with lua function
			{ '<leader>gh', ':Gitsigns stage_hunk<cr>', mode = { 'x' } }
		}
	end,

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
