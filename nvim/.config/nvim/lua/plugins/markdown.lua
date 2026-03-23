---@type LazySpec
return {
	'MeanderingProgrammer/render-markdown.nvim',
	ft = 'markdown',
	dependencies = {
		'jbyuki/nabla.nvim',
		keys = {
			{ '<leader>p', function() require('nabla').popup() end }
		}
	},

	opts = {
		heading = { sign = false, icons = false },
		latex = { enabled = false },
		code = {
			sign = false,
			inline_pad = 1,
			right_pad = 1,
			left_pad = 1,
			width = 'block',
			border = 'thin',
			position = 'right'
		},
		ignore = function() return vim.bo.buftype == 'nofile' end
	}
}
