require('config.lazy')

vim.o.number = true  -- line numbers
vim.o.relativenumber = true
vim.o.list = true  -- render whitespace chars
vim.o.listchars = 'tab:→ ,nbsp:␣,trail:·,precedes:«,extends:»'
vim.o.fillchars = 'eob: '  -- disable '~'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.linebreak = true
vim.o.mousescroll = 'ver:1'  -- reduce touchpad sensitivity
vim.o.winborder = 'rounded'
vim.g.netrw_dirhistmax = 0  -- disable '.netrwhist' file

-- auto insert mode in :term
vim.api.nvim_create_autocmd('TermOpen', {
	pattern = '*',
	callback = function()
		vim.wo.number = false
		vim.cmd('startinsert')
	end
})
