---@type LazySpec
return {
	'sphamba/smear-cursor.nvim',

	-- disable inside TTY, it creates visual artifacts
	cond = not (
		vim.env.XDG_SESSION_TYPE == 'tty' or
		vim.env.TERM == 'linux'
	),
	opts = {
		stiffness = 0.5,
		trailing_stiffness = 0.5,
		matrix_pixel_threshold = 0.5
	}
}
