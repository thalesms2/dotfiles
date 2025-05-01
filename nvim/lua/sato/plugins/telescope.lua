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
	},
	config = function()
		local project_actions = require("telescope._extensions.project.actions")
		require("telescope").setup({
			extensions = {
                glyph = {
                    action = function(glyph)
                        vim.api.nvim_put({ glyph.value }, 'c', false, true)
                    end,
                },
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
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
		})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "gitmoji")
		pcall(require("telescope").load_extension, "glyph")
		pcall(require("telescope").load_extension, "emoji")
		pcall(require("telescope").load_extension, "project")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sr", builtin.git_files, { desc = "[S]earch on [R]epository" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>s?", builtin.builtin, { desc = "[S]earch buildin help[?]" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>s-", builtin.resume, { desc = "[S]earch resume [-]" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = true,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch Neovim [C]onfig" })

		vim.keymap.set("n", "<leader>gm", function()
			require("telescope").extensions.gitmoji.gitmoji()
		end, { desc = "[G]it[M]oji" })

		vim.keymap.set("n", "<leader>sG", function()
			require("telescope").extensions.glyph.glyph()
		end, { desc = "[S]earch [G]lyphs" })

		vim.keymap.set("n", "<leader>s=", function()
			require("telescope").extensions.emoji.emoji()
		end, { desc = "[S]earch emojis [=]" })

		vim.keymap.set("n", "<leader>sp", function()
			require("telescope").extensions.project.project()
		end, { desc = "[S]earch [P]rojects" })
	end,
}
