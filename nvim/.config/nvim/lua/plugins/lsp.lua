---@type LazySpec
return {
	'mason-org/mason-lspconfig.nvim',

	opts = {
		ensure_installed = { 'lua_ls', 'cssls', 'ts_ls' }
	},
	dependencies = {
		'neovim/nvim-lspconfig',
		{ 'mason-org/mason.nvim', opts = {} },
		{ 'ray-x/lsp_signature.nvim', opts = { hint_enable = false } }
	},
	setup = {
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function()
				vim.keymap.set('n', 'grf', vim.lsp.buf.format)
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
				vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { bg = '#525252' })
			end
		})
	}
}
