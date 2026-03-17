---@type LazySpec
return {
	'akinsho/bufferline.nvim',
	version = '*',
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	opts = function()
		local background = '#1d1f27'
		local active_bg = '#111111'
		local inactive_bg = '#17181c'

		return {
			options = {
				style_preset = { 3, 4 },
				separator_style = 'slope',
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				right_mouse_command = false
			},
			highlights = {
				fill = { bg = background },
				background = { bg = inactive_bg },
				buffer_selected = { bg = active_bg },
				buffer_visible = { bg = active_bg },
				separator = { fg = background, bg = inactive_bg },
				separator_visible = { fg = background },
				separator_selected = { fg = background }
			}
		}
	end
}
