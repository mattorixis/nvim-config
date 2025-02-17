return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.pyright.setup({
			on_attach = function(client, bufnr)
				print("Pyright подключен!")
			end,
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
					},
				},
			},
			capabilities = vim.lsp.protocol.make_client_capabilities(),
		})

		lspconfig.ccls.setup({
			on_attach = function(client, bufnr)
				print("CCLS подключен!")
			end,
			cmd = { "ccls" },
			filetypes = { "c", "cpp" },
			settings = {
				ccls = {
					cache = { directory = ".ccls-cache" },
					clang = {
						extraArgs = { "--std=c++17" }, -- Пример флага компилятора?
					},
				},
			},
			capabilities = vim.lsp.protocol.make_client_capabilities(),
		})
	end,
}
