return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		init = function()
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
		end,
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				--[[
	 show_hidden_count = true,
	 
	 hide_gitignored = true,
	 hide_by_name = {
	   -- '.git',
	   -- '.DS_Store',
	   -- 'thumbs.db',
	 },
	--]]
				-- never_show = {},
			},
		},

		window = {
			width = 25, -- Устанавливает начальную ширину окна
		},
	},

	config = function(_, opts)
		-- Определение значков диагностики
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

		-- Настройка neo-tree с переданными opts
		require("neo-tree").setup(opts)
	end,
}
