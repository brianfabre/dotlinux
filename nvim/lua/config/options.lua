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
