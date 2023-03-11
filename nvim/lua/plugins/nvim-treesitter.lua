local M = {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = { "python", "markdown", "lua", "vim", "latex", "r" },
			auto_install = true,
			highlight = {
				enable = true,
				disable = { "latex" },
			},
			incremental_selection = {
				enable = false,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = "<S-CR>",
					node_decremental = "<BS>",
				},
			},
		})
	end,
}

return M
