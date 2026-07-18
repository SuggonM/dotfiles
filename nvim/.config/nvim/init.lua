require('config.lazy')
vim.cmd.packadd('nvim.undotree')
vim.cmd.packadd('nohlsearch')

vim.o.number = true  -- line numbers
vim.o.relativenumber = true
vim.o.list = true  -- render whitespace chars
vim.opt.listchars = {
	tab = '→ ',
	nbsp = '␣',
	lead = '•', trail = '•', multispace = '•',
	precedes = '«',
	extends = '»'
}
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
vim.o.backup = true
vim.o.writebackup = true
vim.o.backupdir = vim.fn.stdpath('state') .. '/backup/'
vim.o.spell = true
vim.o.spelllang = 'en_us'
vim.o.scrolloff = 2
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.pumblend = 15
vim.o.cmdheight = 0
vim.o.cursorline = true
vim.o.laststatus = 3
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1f1f1f' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffffff' })

local nxo = { 'n', 'x', 'o' }

vim.keymap.set('i', 'kj', '<Escape>')
vim.keymap.set('n', 'ZS', vim.cmd.write)
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set(nxo, 'H', '^')
vim.keymap.set(nxo, 'L', 'g_')
vim.keymap.set('n', '<M-s>', 'z=1<CR>', { desc = 'Pick first spell suggestion' })

require('vim._core.ui2').enable({
	enabled = true,
	msg = { targets = 'msg' }
})

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
		vim.opt.formatoptions:remove({ 'r', 'o' })
	end
})

-- enable cmdline auto-suggest (:, /, ?)
vim.o.wildmode = 'noselect:lastused,full'
vim.o.wildoptions = 'pum'
vim.api.nvim_create_autocmd('CmdlineChanged', {
	pattern = { ':', '/', '?' },
	callback = function()
		vim.fn.wildtrigger()
	end
})

-- enable hl-yank (and hl-put for 0.13)
vim.api.nvim_create_autocmd({ 'TextYankPost', --[['TextPutPost']] }, {
	callback = function()
		vim.highlight.on_yank() -- hl_op()
	end
})
