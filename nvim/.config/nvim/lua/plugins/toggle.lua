return {
	'ckolkey/ts-node-action',
	keys = {
		{ '<leader>t', function() require('ts-node-action').node_action() end }
	}
}
