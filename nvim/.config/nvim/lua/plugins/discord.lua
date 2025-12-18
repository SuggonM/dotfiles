---@type LazySpec
return {
	'vyfor/cord.nvim',
	build = ':Cord update',

	opts = {
		editor = {
			tooltip = 'The superior command-line text editor'
		},
		display = {
			theme = 'default',
			flavor = 'accent'
		},
		timestamp = {
			enabled = false
		},
		text = {
			workspace = function(opts)
				return string.format('In ../%s/', opts.workspace)
			end
		}
	}
}
