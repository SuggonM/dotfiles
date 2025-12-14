return {
	'mason-org/mason-lspconfig.nvim',

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
						text = { '', '', '', '' },
						numhl = {
							'ErrorMsg',
							'WarningMsg',
							'DiagnosticInfo',
							'DiagnosticHint'
						}
					}
				})
			end
		})
	}
}
