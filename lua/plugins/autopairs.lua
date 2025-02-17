return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter", -- Плагин загружается при входе в режим вставки
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true, -- Используем Tree-sitter
				enable_afterquote = true, -- Автозакрытие для кавычек
				enable_check_bracket_line = false, -- Отключаем проверку на текущей строке
				map_cr = true, -- Включаем автоматический отступ при нажатии Enter
				fast_wrap = {}, -- Отключаем быстрые обертки для скобок
			})
		end,
	},
}
