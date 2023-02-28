-- function
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- copy to clipboard
map("v", "<Leader>y", '"*y')
-- no register for x
map("n", "x", '"_x')
-- leave insert mode
map("i", "jk", "<esc>")

-- move between buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")
map("n", "<Leader>qq", ":bdelete!<CR>", { desc = "Quit buffer" })
map("n", "<Leader>qa", ":%bd|e#<CR>:bnext<CR>:bd<CR>e", { desc = "Quit all other buffers" })

-- move between panes to left/bottom/top/right
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- faster in/outdenting
map("i", "<<", "<c-d>")
map("i", ">>", "<c-t>")

-- map("n", "<Leader>v", ":Lexplore <CR>", { desc = "Toggle netrw" })
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", { desc = "Set working dir as current file" })
map("n", "<leader>k", ":update<CR>", { desc = "Save" })
map("n", "<leader>qp", ":qa!<CR>", { desc = "Quit Neovim" })
