vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.linebreak = true
vim.o.undofile = true
vim.o.splitright = true
vim.o.cursorline = true
vim.keymap.set('i', 'kj', '<Escape>')

-- enable cmdline auto-suggest (:, /, ?)
vim.o.wildmode = 'noselect:lastused,full'
vim.o.wildoptions = 'pum'
vim.api.nvim_create_autocmd('CmdlineChanged', {
	pattern = { ':', '/', '?' },
	callback = function()
		vim.fn.wildtrigger()
	end
})
