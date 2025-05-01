return { -- Highlight todo, notes, etc in comments
	"folke/todo-comments.nvim",
    event = "VeryLazy",
	opts = {
		keywords = {
			TODO = {
				alt = { "TODO", "todo", "ToDo" },
			},
			FIXME = {
				alt = { "FIX", "FIXME", "fix", "fixme", "FixMe" },
			},
		},
		search = {
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--hidden",
			},
		},
	},
	keys = {
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous todo comment",
		},
		{
			"<leader>sT",
			function()
				local cwd = vim.fn.expand("%:p:h")
				vim.cmd("TodoTelescope cwd=" .. cwd)
			end,
			desc = "find todos in file",
		},
		{
			"<leader>st",
			function()
				local cwd = require("telescope.utils").buffer_dir()
				vim.cmd("TodoTelescope cwd=" .. cwd)
			end,
			desc = "find todos in the project",
		},
		{
			"<leader>stt",
			":TodoTelescope<CR>",
			desc = "find todos in all project",
		},
	},
}
