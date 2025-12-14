return {
	'mason-org/mason-lspconfig.nvim',

	-- enabled = false,
	opts = {
		ensure_installed = { 'lua_ls', 'cssls', 'ts_ls' }
	},
	dependencies = {
		{ 'mason-org/mason.nvim', opts = {} },
		'neovim/nvim-lspconfig'
	},
	setup = {
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function()
				vim.keymap.set('n', 'grf', vim.lsp.buf.format)
				vim.lsp.config('*', {
					capabilities = require('cmp_nvim_lsp').default_capabilities()
				})
				vim.diagnostic.config({
					virtual_text = true,
					signs = {
						text = {
							[vim.diagnostic.severity.HINT] = '',
							[vim.diagnostic.severity.INFO] = '',
							[vim.diagnostic.severity.WARN] = '',
							[vim.diagnostic.severity.ERROR] = ''
						},
						numhl = {
							[vim.diagnostic.severity.HINT] = 'DiagnosticHint',
							[vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
							[vim.diagnostic.severity.WARN] = 'WarningMsg',
							[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
						}
					}
				})
			end
		})
	}
}
