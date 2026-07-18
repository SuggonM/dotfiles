---@type LazySpec
return {
	'glacambre/firenvim',
	build = ':call firenvim#install(0)',

	init = function()
		vim.g.firenvim_config = {
			globalSettings = {
				ignoreKeys = { all = { '<SA-P>', '<SA-V>' } }
			},
			localSettings = {
				['.*'] = {
					filename = '{pathname}',
					takeover = 'never',
					cmdline = 'neovim',
					content = 'markdown'
				}
			}
		}
	end,

	config = function()
		if vim.g.started_by_firenvim == true then
			vim.api.nvim_create_autocmd('BufReadPost', {
				callback = function()
					require('vim._core.ui2').enable({ enabled = true, msg = { targets = 'msg' } })
					require('treesitter-context').disable()
					vim.o.laststatus = 0
					vim.o.autochdir = true
					vim.o.guifont = 'Comic Code:h14'
					-- hack to run ftplugins and get snippets from both languages
					vim.o.filetype = 'mediawiki'
					vim.o.filetype = 'html'
					vim.o.syntax = 'mediawiki'

					vim.api.nvim_create_autocmd({
						'InsertLeave',
						'TextChanged',
						'FocusLost'
					}, {
						nested = true,
						command = 'silent update'
					})
				end
			})
		end
	end
}
