---@type LazySpec
return {
	'nvim-treesitter/nvim-treesitter-context',
	dependencies = {
		'nvim-treesitter/nvim-treesitter'
	},
	opts = {
		max_lines = 1,
		on_attach = function()
			vim.api.nvim_set_hl(0, 'TreesitterContextBottom', { underdashed = true })
		end
	}
}
