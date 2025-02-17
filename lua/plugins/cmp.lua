return {
	{ "neovim/nvim-lspconfig" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			-- "L3MON4D3/LuaSnip",
			-- "saadparwaiz1/cmp_luasnip",
			-- "echasnovski/mini.snippets",
			-- "abeldekat/cmp-mini-snippets",
			-- "SirVer/ultisnips",
			-- "quangnguyen30192/cmp-nvim-ultisnips",
			-- "dcampos/nvim-snippy",
			-- "dcampos/cmp-snippy",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- Для vsnip
						-- require('luasnip').lsp_expand(args.body) -- Для luasnip
						-- require('snippy').expand_snippet(args.body) -- Для snippy
						-- vim.fn["UltiSnips#Anon"](args.body) -- Для ultisnips
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "vsnip" },
				}, { { name = "buffer" } }),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Замените '<YOUR_LSP_SERVER>' на нужные LSP
			-- lspconfig.tsserver.setup { capabilities = capabilities }
			-- lspconfig.pyright.setup { capabilities = capabilities }
		end,
	},
}
