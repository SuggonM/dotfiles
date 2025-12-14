return {
	'nvim-treesitter/nvim-treesitter', branch = 'master', lazy = false, build = ':TSUpdate',

	-- enabled = false,
	config = function()
		local configs = require('nvim-treesitter.configs')
		configs.setup {
			auto_install = true,
			highlight = { enable = true }
		}
	end
}
