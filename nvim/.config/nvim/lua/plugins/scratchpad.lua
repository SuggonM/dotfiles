---@type LazySpec
return {
	'https://git.sr.ht/~swaits/scratch.nvim',
	lazy = true,
	keys = {
		{ '<leader>.', vim.cmd.ScratchSplit }
	},
	opts = {}
}
