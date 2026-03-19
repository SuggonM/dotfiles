---@type LazySpec
return {
	'catgoose/nvim-colorizer.lua',
	cmd = 'ColorizerToggle',
	opts = {
		parsers = { css = true },
		display = {
			mode = 'virtualtext',
			virtualtext = { position = 'before' }
		}
	}
}
