return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'theHamsta/nvim-dap-virtual-text',
		'igorlfs/nvim-dap-view'
	},

	config = function()
		require('nvim-dap-virtual-text').setup()
		local dap = require('dap')
		local dapview = require('dap-view')

		dapview.setup({
			winbar = { controls = { enabled = true }}
		})

		vim.keymap.set('n', '<M-b>',     dap.toggle_breakpoint)
		vim.keymap.set('n', '<M-CR>',    dap.continue)
		vim.keymap.set('n', '<M-Down>',  dap.step_over)
		vim.keymap.set('n', '<M-Right>', dap.step_into)
		vim.keymap.set('n', '<M-Left>',  dap.step_out)
		vim.keymap.set('n', '<M-Up>',    dap.run_last)

		vim.keymap.set('n', '<M-r>', function()
			dapview.open()
			dapview.jump_to_view('repl')
		end)
		vim.keymap.set('n', '<M-s>', function()
			dapview.jump_to_view('scopes')
		end)

		dap.listeners.before.launch.dapui_config = dapview.open

		-- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		dap.adapters['pwa-node'] = {
			type = 'server',
			host = 'localhost',
			port = '${port}',
			executable = {
				command = 'node',
				args = {
					vim.fn.stdpath('data')
					.. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js',
					'${port}'
				}
			}
		}

		dap.configurations.javascript = {
			{
				type = 'pwa-node',
				request = 'launch',
				name = 'Launch file',
				program = '${file}',
				cwd = '${workspaceFolder}'
			}
		}
	end
}
