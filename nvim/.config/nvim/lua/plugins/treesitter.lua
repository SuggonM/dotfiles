return {
	'nvim-treesitter/nvim-treesitter', branch = 'master', lazy = false, build = ':TSUpdate',

	config = function()
		local configs = require('nvim-treesitter.configs')
		configs.setup {
			ensure_installed = { 'css', 'javascript', 'bash', 'c', 'java', 'python', 'lua', 'markdown' },
			highlight = { enable = true }
		}
	end
}
