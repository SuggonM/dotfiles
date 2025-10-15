return {
	{ 'jiangmiao/auto-pairs' },
	{
		'kylechui/nvim-surround',
		event = 'VeryLazy',

		config = function()
			require('nvim-surround').setup()
		end
	}
}
