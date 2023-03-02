local M = {

	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-omni",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			-- "hrsh7th/cmp-nvim-lsp",
			-- "hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-path",
		},
		config = function()
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			cmp.setup({

				snippet = {
					expand = function(args)
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},

				window = {
					-- completion = cmp.config.window.bordered({
					-- 	border = "single",
					-- 	col_offset = -1,
					-- }),
					documentation = cmp.config.window.bordered({
						border = "single",
					}),
				},

				mapping = {

					-- ... Your other mappings ...

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
						-- they way you will only jump inside the snippet region
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),

					-- ... Your other mappings ...
				},
				sources = cmp.config.sources({
					{ name = "omni" },
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),

				-- ... Your other configuration ...
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
}

return M
