local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			reload_on_bufenter = true,
			respect_buf_cwd = true,
			-- update_focused_file = {
			-- 	enable = true,
			-- 	update_root = true,
			-- },
			renderer = {
				icons = {
					show = {
						-- file = false,
						-- folder = false,
						-- folder_arrow = false,
						git = false,
						-- modified = false,
					},
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<cr>", {
			desc = "Toggle NvimTree",
			silent = true,
		})

		vim.g.loaded = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}

return M
