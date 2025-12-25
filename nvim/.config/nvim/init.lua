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
vim.o.undofile = true
vim.o.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1f1f1f' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffffff' })

-- avoid 'block' cursor in TTY to avoid weird character rendering
if os.getenv.XDG_SESSION_TYPE == 'tty' then
	vim.o.guicursor = vim.o.guicursor .. ',n-c:ver25'
end

-- auto insert mode in :term
vim.api.nvim_create_autocmd('TermOpen', {
	pattern = '*',
	callback = function()
		vim.wo.number = false
		vim.cmd('startinsert')
	end
})

-- permanently disable "//" auto-insert on new line
vim.api.nvim_create_autocmd('FileType', {
	pattern = '*',
	callback = function()
		vim.o.formatoptions = vim.o.formatoptions:gsub('[ro]', '')
	end
})
