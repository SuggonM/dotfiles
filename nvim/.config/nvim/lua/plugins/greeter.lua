---@type LazySpec
return {
	'goolord/alpha-nvim',
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

		vim.keymap.set('n', '<leader>a', require('alpha').start)
	end
}
