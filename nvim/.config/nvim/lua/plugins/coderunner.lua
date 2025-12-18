---@type LazySpec
return {
	'CRAG666/code_runner.nvim',

	keys = {
		{ '<leader>rr', vim.cmd.RunCode }
	},

	opts = {
		before_run_filetype = vim.cmd.write,
		filetype = {
			java = 'java',
			python = 'python3 -u'
		}
	},

	config = function(_, opts)
		local project_config = {}
		local project_config_file = vim.fn.getcwd() .. '/.code_runner.lua'
		local has_project_config = vim.fn.filereadable(project_config_file)
		if has_project_config == 1 then
			project_config = dofile(project_config_file)
		end

		local merged_config = vim.tbl_deep_extend('force', opts, project_config)
		require('code_runner').setup(merged_config)
	end
}
