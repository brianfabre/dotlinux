return { 
	  "vimwiki/vimwiki",
	  init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/Bob/wiki/",
				syntax = "markdown",
				ext = ".md",
				diary_rel_path = "journal/",
				diary_index = "journal",
				diary_header = "Journal",
			},
		}
		vim.g.vimwiki_global_ext = 0
		vim.g.vimwiki_hl_headers = 1
		vim.g.vimwiki_auto_chdir = 1
		vim.g.vimwiki_key_mappings = { table_mappings = 0 }
	end,
  }

