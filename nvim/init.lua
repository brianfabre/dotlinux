vim.g.mapleader = " "
vim.g.maplocalleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

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

map("n", "<Leader>v", ":Lexplore <CR>", { desc = "Toggle netrw" })
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", { desc = "Set working dir as current file" })
map("n", "<leader>k", ":update<CR>", { desc = "Save" })
map("n", "<leader>qp", ":qa!<CR>", { desc = "Quit Neovim" })

vim.opt.mouse = nil
vim.opt.hlsearch = false
vim.opt.incsearch = true -- search as characters are entered
vim.opt.tabstop = 4 -- sets tab spacing
vim.opt.shiftwidth = 4 -- sets tab spacing
vim.opt.expandtab = true -- sets tab spacing
vim.opt.autoindent = true
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true -- case-insensitive search
vim.opt.linebreak = true -- doesnt split words
vim.opt.breakindent = true -- enable indentation
vim.opt.breakindentopt = { "shift:4", "sbr", "list:-1" } -- indent by an additional 4 characters on wrapped line
vim.opt.showbreak = ">" -- append '>>' to indent
vim.opt.swapfile = false

if os.getenv("WAYLAND_DISPLAY") then
	-- Wayland
	vim.g.clipboard = {
		copy = {
			["+"] = "wl-copy",
			["*"] = "wl-copy",
		},
		paste = {
			["+"] = "wl-paste",
			["*"] = "wl-paste",
		},
		cache_enabled = 1,
	}
end

vim.cmd([[
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]])

vim.g.netrw_keepdir = 1
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0

-- local group = vim.api.nvim_create_augroup("netrwgroup", { clear = true })
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "netrw" },
-- 	callback = function()
-- 		vim.keymap.set("n", ".", "gh", { silent = true })
-- 	end,
-- 	group = group,
-- })

vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for netrw",
	callback = function()
		local map = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end

		-- new file
		map("a", "%")
		-- toggle hidden
		map(".", "gh")
		-- rename file
		map("r", "R")
		-- mark file
		map("<TAB>", "mf")
	end,
})
