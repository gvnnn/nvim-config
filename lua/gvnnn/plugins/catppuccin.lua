return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	opts = {
		styles = {
			comments = {'italic'}
		}
	},
	config = function()
		vim.cmd([[colorscheme catppuccin]])
	end
}
