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

		-- setup
		require("formatter").setup({
			-- logging = true,
			filetype = {
				lua = { stylua },
				-- r = { styler },
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
