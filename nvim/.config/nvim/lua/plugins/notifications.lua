---@type LazySpec
return {
	'rcarriga/nvim-notify',

	opts = {
		background_colour = '#000000',
		render = 'minimal',
		stages = 'fade',
		on_open = function(win)
			vim.wo[win].winblend = 30
		end,
	},
	init = function()
		vim.notify = require('notify')
	end
}
