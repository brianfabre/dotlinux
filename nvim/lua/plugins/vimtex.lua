return {
	"lervag/vimtex",
	config = function()
		vim.cmd([[let g:vimtex_view_method = 'zathura']])
		vim.cmd([[
        filetype plugin indent on
        syntax enable
        ]])
		vim.g.vimtex_quickfix_mode = 0
		-- vim.g.vimtex_view_forward_search_on_start = 0
	end,
}
