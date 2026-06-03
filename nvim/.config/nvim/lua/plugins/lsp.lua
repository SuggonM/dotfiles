---@type LazySpec
return {
	'mason-org/mason-lspconfig.nvim',

	opts = {
		ensure_installed = { 'lua_ls', 'cssls', 'ts_ls', 'jsonls', 'bashls' }
	},
	dependencies = {
		'neovim/nvim-lspconfig',
		{ 'mason-org/mason.nvim', opts = {} },
		{ 'ray-x/lsp_signature.nvim', opts = { hint_enable = false } },
		{ 'j-hui/fidget.nvim', opts = {} }
	},
	setup = {
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function()
				vim.keymap.set('n', 'grf', vim.lsp.buf.format)
				vim.keymap.set('n', 'grh', function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end)
				vim.lsp.document_color.enable(true, nil, { style = 'virtual' })

				vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
				vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { bg = '#525252' })

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
