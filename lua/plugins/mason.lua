return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- Плагин для интеграции Mason с LSP
		"neovim/nvim-lspconfig", -- Конфигурация LSP для Neovim
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded", -- Используем закругленные границы для UI Mason
				icons = {
					package_installed = "✓", -- Иконка для установленных пакетов
					package_pending = "➜", -- Иконка для пакетов в процессе установки
					package_uninstalled = "✗", -- Иконка для удаленных пакетов
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls", -- Сервер LSP для Lua (используется, например, в Neovim)
				"pyright", -- Сервер LSP для Python
				"clangd", -- Сервер LSP для C/C++
				--				"tsserver", -- Сервер LSP для TypeScript/JavaScript
				"eslint", -- LSP-сервер для диагностики и исправления кода JS/TS
				"rust_analyzer", -- Сервер LSP для Rust
			},
			automatic_installation = true, -- Автоматически устанавливать отсутствующие LSP-серверы
		})
	end,
}
