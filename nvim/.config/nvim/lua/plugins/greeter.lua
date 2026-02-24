---@type LazySpec
return {
	'SuggonM/alpha-nvim',
	branch = 'fix-config-btn',
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	config = function()
		local theme = require('alpha.themes.theta')
		theme.config.layout[2].val = {
			[[ ╔═════════════════════  ＮｅｏＶｉｍ  ════════════════════╗ ]],
			[[ .   ☄️  .˚   ✦˚    .   🌌  ˚   ✦   🪐  .  ˚    🌏   .  ˚  * ]],
			[[ ˚   .  ✦   🌙  ˚ ˚   .   ✦  💫   .  *   ✦  ☀️  ˚    *     . ]],
			[[ .   ˚   ✧   .   🛰️   *   ✦˚   🌟    .   ˚   ✦   🌙    .   ˚ ]],
			[[ *    .˚   💫   .    ✦    🌏   ˚   ☄️   ✧   🌌 ˚ .      ˚  * ]]
		}
		theme.config.layout[2].opts.hl = 'Normal'
		require('alpha').setup(theme.config)
	end
}
