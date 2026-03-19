---@type LazySpec
return {
	'tamton-aquib/staline.nvim',
	config = function()
		vim.api.nvim_create_autocmd('BufAdd', {
			pattern = '*',
			callback = function()
				local bufcount = #vim.fn.getbufinfo({ buflisted = 1 })
				vim.o.showtabline = (bufcount > 1) and 2 or 0
			end
		})
		require('stabline').setup({
			bg = '#111111',
			stab_bg = '#1d1f27',
			inactive_bg = '#17181c',
			inactive_fg = '#888888',
			style = 'slant',
			stab_right = '',
			stab_start = '  ',
			font_active = 'none'
		})
	end
}
