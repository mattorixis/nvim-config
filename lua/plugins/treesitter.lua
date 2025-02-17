return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "c", "cpp", "lua", "typescript", "javascript" },
		sync_install = false,
		auto_install = true,
		highlight = { enable = true, disable = { "neo-tree" } },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer", -- Вся функция
					["if"] = "@function.inner", -- Внутри функции
					["ac"] = "@class.outer", -- Весь класс (C++)
					["ic"] = "@class.inner", -- Внутри класса (C++)
				},
			},
		},
	},
}
