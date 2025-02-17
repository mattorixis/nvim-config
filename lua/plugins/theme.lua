return {
	"EdenEast/nightfox.nvim",
	config = function()
		vim.opt.termguicolors = true

		function SetColor(color)
			color = color or "habamax"
			vim.cmd.colorscheme(color)

			-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
			-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
			-- vim.api.nvim_set_hl(0, "ColorColumn", {bg = "none"})
			-- vim.api.nvim_set_hl(0, "LineNr", {bg = "none"})
		end

		-- SetColor('nightfox')
		-- SetColor('terafox')
		SetColor("nordfox")
		-- SetColor('carbonfox')
	end,
}
