vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree") -- Открыть NeoTree
		--    vim.cmd("vertical resize 25")
		vim.cmd("wincmd l") -- Перейти в окно справа
		vim.cmd("split") -- Открыть сплит
		vim.cmd("term") -- Открыть терминал
		vim.cmd("resize 6")
		vim.cmd("wincmd h") -- Перейти в окно справа
	end,
})

vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter" }, {
	pattern = "*",
	callback = function()
		-- Проверяем, что окно - терминал
		if vim.bo.buftype == "terminal" then
			local last_file_dir = vim.fn.expand("#:p:h") -- Получаем путь к папке последнего редактируемого файла
			if last_file_dir ~= "" then
				vim.api.nvim_chan_send(
					vim.b.terminal_job_id,
					"cd " .. vim.fn.fnameescape(last_file_dir) .. " && clear\n"
				)
			end
		end
	end,
})
