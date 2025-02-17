return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				-- Используем eslint_d для форматирования TypeScript и JavaScript файлов
				null_ls.builtins.formatting.eslint_d.with({
					filetypes = {
						"typescript",
						"javascript",
						"typescriptreact",
						"javascriptreact",
					},
				}), -- Форматирование Lua
				null_ls.builtins.formatting.lua_format,
				-- Диагностика ESLint для JavaScript/TypeScript
				null_ls.builtins.diagnostics.eslint_d,
				-- Форматирование Lua с помощью stylua
				null_ls.builtins.formatting.stylua,
				-- PrettierD для форматирования различных файлов
				null_ls.builtins.formatting.prettierd.with({
					filetypes = {
						"css",
						"scss",
						"less",
						"html",
						"json",
						"jsonc",
						"yaml",
						"markdown",
						"markdown.mdx",
						"graphql",
						"handlebars",
					},
				}), -- Добавленные форматтеры
				null_ls.builtins.formatting.black, -- Форматирование Python
				null_ls.builtins.formatting.clang_format, -- Форматирование C и C++
			},
			on_attach = function(client, bufnr)
				-- Проверяем, поддерживает ли клиент форматирование
				if client.supports_method("textDocument/formatting") then
					-- Очищаем предыдущие автокоманды для форматирования
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					-- Создаем автокоманду для автоформатирования перед сохранением файла
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls" -- Используем только null-ls для форматирования
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
