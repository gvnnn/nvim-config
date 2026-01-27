local mr = require("mason-registry")

local servers = {
	{ pkg = "gopls", lspConfig = "gopls", config = {
		analyses = { unusedparameters = true },
		staticcheck = true,
		gofumpt = true,
	} },
	{ pkg = "bash-language-server", lspConfig = "bashls", config = {}},
}

mr.refresh(function()
  for _, srv in pairs(servers) do
    local p = mr.get_package(srv.pkg)
    if not p:is_installed() then
      p:install()
    end

    vim.lsp.enable(srv.lspConfig)

    vim.lsp.config(srv.lspConfig, srv.config)
  end
end)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
    end

    if client.name == "gopls" and client:supports_method('textDocument/codeAction') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp.go', {clear = false}),
        buffer = args.buf,
        callback = function()
          -- Organize Imports
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
          })
        end,
      })
    end

    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
