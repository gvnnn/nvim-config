return {
	{ pkg = "gopls", lspConfig = "gopls", config = {
		analyses = { unusedparameters = true },
		staticcheck = true,
		gofumpt = true,
	}},
	{ pkg = "bash-language-server", lspConfig = "bashls", config = {}},
}
