return {
	"mhartington/formatter.nvim",
	config = function()
		-- lua
		local stylua = function()
			return {
				exe = "stylua",
				args = { "-" },
				stdin = true,
			}
		end

		local black = function()
			return {
				exe = "black",
				args = { "-" },
				stdin = true,
			}
		end

		local styler = function()
			return {
				exe = "R",
				args = {
					"--slave",
					"--no-restore",
					"--no-save",
					"-e",
					"'con <- file(\"stdin\"); styler::style_text(readLines(con)); close(con)'",
					"2>/dev/null",
				},
				stdin = true,
			}
		end

		-- setup
		require("formatter").setup({
			-- logging = true,
			filetype = {
				lua = { stylua },
				python = { black },
				r = { styler },
			},
		})

		-- autoformat on save
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			pattern = "*",
			command = "silent FormatWrite",
			group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true }),
		})
	end,
}
