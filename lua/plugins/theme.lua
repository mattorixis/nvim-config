return {
	"EdenEast/nightfox.nvim",
	config = function()
		vim.opt.termguicolors = true

		function SetColor(color)
			color = color or "habamax"
			vim.cmd.colorscheme(color)
		end

		-- SetColor('nightfox')
		-- SetColor('terafox')
		SetColor("nordfox")
		-- SetColor('carbonfox')
	end,
}
