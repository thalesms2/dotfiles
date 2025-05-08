return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod" },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	keys = { -- Mapping to toggle DBUI
		{ "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_show_help = 0
		vim.g.db_ui_win_position = "left"
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_use_nvim_notify = 1

		local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "sql", "mysql", "plsql" },
			callback = function()
				require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
			end,
			group = autocomplete_group,
		})
		vim.g.db_ui_hide_schemas = { "pg_toast_temp.*" }
	end,
}
