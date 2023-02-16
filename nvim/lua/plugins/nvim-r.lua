return {
	"jalvesaq/Nvim-R",
	config = function()
		vim.cmd([[let R_assign_map = '..']])
		-- vim.cmd([[let g:R_auto_start = 2]])
		vim.cmd([[let R_csv_app = 'terminal:vd']])

		vim.cmd([[
        let R_set_omnifunc = ["r"]
		let R_auto_omni = ["r"]
        " let R_fun_data_1 = ['select', 'rename', 'mutate', 'filter']
        ]])

		vim.cmd([[let R_rconsole_height = winheight(0) / 3]])
		vim.cmd([[let R_rconsole_width = 0]])
	end,
}
