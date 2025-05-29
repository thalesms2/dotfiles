return {
	"kristijanhusak/vim-dadbod-ui",
    lazy = true,
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
	},
	keys = {
		{ "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_show_help = 1
		vim.g.db_ui_win_position = "left"
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_use_nvim_notify = 1
	end,
}
