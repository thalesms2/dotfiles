return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		{ "olacin/telescope-gitmoji.nvim" },
		{ "ghassan0/telescope-glyph.nvim" },
		{ "xiyaowong/telescope-emoji.nvim" },
		{ "nvim-telescope/telescope-project.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{ "aaronhallaert/advanced-git-search.nvim" },
	},
	opts = function()
		local t = require("telescope")
		local builtin = require("telescope.builtin")
		local ext = require("telescope").extensions
		local themes = require("telescope.themes")

		pcall(t.load_extension, "fzf")
		pcall(t.load_extension, "ui-select")
		pcall(t.load_extension, "gitmoji")
		pcall(t.load_extension, "glyph")
		pcall(t.load_extension, "emoji")
		pcall(t.load_extension, "project")
		pcall(t.load_extension, "undo")
		pcall(t.load_extension, "advanced_git_search")
		pcall(t.load_extension, "yank_history")

		local project_actions = require("telescope._extensions.project.actions")

		require("which-key").add({
			{ "<leader>sh", function() builtin.help_tags() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>sr", function() builtin.git_files() end, desc = "[S]earch on [R]epository", mode = "n", },
			{ "<leader>sk", function() builtin.keymaps() end, desc = "[S]earch [K]eymaps", mode = "n", },
			{ "<leader>sf", function() builtin.find_files() end, desc = "[S]earch [F]iles", mode = "n", },
			{ "<leader>s?", function() builtin.builtin() end, desc = "[S]earch buildin help[?]", mode = "n", },
			{ "<leader>sw", function() builtin.grep_string() end, desc = "[S]earch current [W]ord", mode = "n", },
			{ "<leader>sg", function() builtin.live_grep() end, desc = "[S]earch by [G]rep", mode = "n", },
			{ "<leader>sd", function() builtin.diagnostics() end, desc = "[S]earch [D]iagnostics", mode = "n", },
			{ "<leader>s-", function() builtin.resume() end, desc = "[S]earch resume [-]", mode = "n", },
			{ "<leader>s.", function() builtin.oldfiles() end, desc = '[S]earch Recent Files ("." for repeat)', mode = "n", },
			{ "<leader><leader>", function() builtin.buffers() end, desc = "[ ] Find existing buffers", mode = "n", },
			{ "<leader>sc", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "[S]earch Neovim [C]onfig", },
			{ "<leader>gm", function() ext.gitmoji.gitmoji() end, desc = "[G]it[M]oji", },
			{ "<leader>sG", function() ext.glyph.glyph() end, desc = "[S]earch [G]lyphs", },
			{ "<leader>s=", function() ext.emoji.emoji() end, desc = "[S]earch emojis [=]", },
			{ "<leader>su", function() ext.undo.undo() end, desc = "[S]earch [U]ndo", },
			{ "<leader>sp", function() ext.project.project() end, desc = "[S]earch [P]rojects", },
			{ "<leader>sag", function() ext.advanced_git_search.changed_on_branch() end, desc = "[S]earch using [A]dvanced [G]it search", },
			{ "<leader>/", function() builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = true, })) end, desc = "[/] Fuzzily search in current buffer", },
			{ "<leader>s/", function() builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files", }) end, desc = "[S]earch [/] in Open Files", },
            { "<leader>sy", function() ext.yank_history.yank_history() end, desc = "[S]earch [Y]anky" }
		})

		return {
			extensions = {
				glyph = {
					action = function(glyph)
						vim.api.nvim_put({ glyph.value }, "c", false, true)
					end,
				},
				["ui-select"] = {
					themes.get_dropdown(),
				},
				undo = {
					-- telescope-undo.nvim config, see below
				},
				advanced_git_search = {},
				project = {
					ignore_missing_dirs = true, -- default: false
					hidden_files = true, -- default: false
					theme = "dropdown",
					order_by = "asc",
					search_by = "title",
					-- default for on_project_selected = find project files
					-- on_project_selected = function(prompt_bufnr)
					-- 	-- Do anything you want in here. For example:
					-- 	project_actions.change_working_directory(prompt_bufnr, false)
					--                    vim.cmd.Oil()
					-- end,
					mappings = {
						n = {
							["d"] = project_actions.delete_project,
							["r"] = project_actions.rename_project,
							["c"] = project_actions.add_project,
							["C"] = project_actions.add_project_cwd,
							["f"] = project_actions.find_project_files,
							["b"] = project_actions.browse_project_files,
							["s"] = project_actions.search_in_project_files,
							["R"] = project_actions.recent_project_files,
							["w"] = project_actions.change_working_directory,
							["o"] = project_actions.next_cd_scope,
						},
						i = {
							["<c-d>"] = project_actions.delete_project,
							["<c-v>"] = project_actions.rename_project,
							["<c-a>"] = project_actions.add_project,
							["<c-A>"] = project_actions.add_project_cwd,
							["<c-f>"] = project_actions.find_project_files,
							["<c-b>"] = project_actions.browse_project_files,
							["<c-s>"] = project_actions.search_in_project_files,
							["<c-r>"] = project_actions.recent_project_files,
							["<c-l>"] = project_actions.change_working_directory,
							["<c-o>"] = project_actions.next_cd_scope,
						},
					},
				},
			},
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						size = {
							width = "95%",
							height = "95%",
						},
					},
				},
			},
		}
	end,
}
