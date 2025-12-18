---@type LazySpec
return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',

	config = function()
		local treesitter = require('nvim-treesitter')

		vim.api.nvim_create_autocmd('FileType', {
			group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
			desc = 'Auto-install parsers, enable treesitter highlight and indent',
			callback = function(event)
				local lang = vim.treesitter.language.get_lang(event.match) or event.match
				local buf = event.buf

				-- Start highlighting immediately (works if parser exists)
				pcall(vim.treesitter.start, buf, lang)

				-- Install missing parsers (async, no-op if already installed)
				treesitter.install({ lang })

				-- Enable treesitter indentation
				-- vim.bo[buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
			end
		})
	end
}
