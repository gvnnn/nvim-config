return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		local parsers = {
			"bash",
			"diff",
			"go",
			"html",
			"json",
			"lua",
			"markdown",
			"python",
			"vim" ,
			"vimdoc" ,
		}
		require('nvim-treesitter').setup()

		vim.defer_fn(function()
			require('nvim-treesitter').install(parsers):wait(300000)
		end, 0)

		vim.api.nvim_create_autocmd('FileType', {
			pattern = parsers,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
