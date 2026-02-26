---@type LazySpec
return {
	'glacambre/firenvim',
	build = ':call firenvim#install(0)',

	init = function()
		vim.g.firenvim_config = {
			globalSettings = {
				ignoreKeys = { all = { '<SA-P>' } }
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
					vim.keymap.set('n', '<Esc><Esc>', vim.fn['firenvim#focus_page'])
					vim.o.autochdir = true
					vim.o.guifont = 'Monaco:h15'
					vim.o.syntax = 'mediawiki'
					require('lualine').hide()

					vim.api.nvim_create_autocmd({
						'InsertLeave',
						'TextChanged',
						'FocusLost'
					}, {
						nested = true,
						command = 'silent write'
					})
				end
			})
		end
	end
}
