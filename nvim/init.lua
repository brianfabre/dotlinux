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

require("config.mappings")
require("config.options")
require("utils.run_code")
require("utils.autohide_tab")

vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

-- vim.cmd("colorscheme nightfox")
vim.cmd("colorscheme kanagawa")
