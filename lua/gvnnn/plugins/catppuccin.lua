return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	opts = {
		styles = {
			comments = {'italic'}
		},
		custom_highlights = function(colors)
			return {
				LineNr = { fg = colors.subtext1 },
				NonText = { fg = colors.overlay0 },
				Whitespace = { fg = colors.overlay0 },
			}
		end,
	},
	config = function(_, opts)
		require('catppuccin').setup(opts)
		vim.cmd([[colorscheme catppuccin]])
	end
}
