vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree")
		--    vim.cmd("vertical resize 25")
		vim.cmd("wincmd l")
		vim.cmd("split")
		vim.cmd("term")
		vim.cmd("resize 6")
		vim.cmd("wincmd h")
	end,
})

vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter" }, {
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "terminal" then
			local last_file_dir = vim.fn.expand("#:p:h")
			if last_file_dir ~= "" then
				vim.api.nvim_chan_send(
					vim.b.terminal_job_id,
					"cd " .. vim.fn.fnameescape(last_file_dir) .. " && clear\n"
				)
			end
		end
	end,
})
