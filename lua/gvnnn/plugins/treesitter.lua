return {
	'nvim-treesitter/nvim-treesitter',
	version = '*',
	lazy = false,
	build = ':TSUpdate',
	opts = {
		ensure_installed = {
			"bash",
			"diff",
			"go",
			"html",
			"json",
			"lua",
			"markdown",
			"vim" ,
			"vimdoc" ,
		},
		highlight = { enabled = true },
	},
}
