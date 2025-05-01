return {
	"folke/snacks.nvim",
	priority = 999,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		animate = { enabled = true },
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		image = {
			enabled = true,
		},
		indent = { enabled = false },
		input = { enabled = false },
		lazygit = { enabled = true },
		picker = {
			enabled = true,
			win = {
				input = {
					keys = {
						["<a-s>"] = { "flash", mode = { "n", "i" } },
						["s"] = { "flash" },
					},
				},
			},
			actions = {
				flash = function(picker)
					require("flash").jump({
						pattern = "^",
						label = { after = { 0, 0 } },
						search = {
							mode = "search",
							exclude = {
								function(win)
									return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
								end,
							},
						},
						action = function(match)
							local idx = picker.list:row2idx(match.pos[1])
							picker.list:_move(idx, true, true)
						end,
					})
				end,
			},
		},
		notifier = { enabled = true, style = "compact" },
		quickfile = { enabled = true },
		scope = { enabled = false },
		scratch = {
			name = "Scratch",
			ft = function()
				if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
					return vim.bo.filetype
				end
				return "markdown"
			end,
			---@type string|string[]?
			icon = nil, -- `icon|{icon, icon_hl}`. defaults to the filetype icon
			root = vim.fn.stdpath("data") .. "/scratch",
			autowrite = true, -- automatically write when the buffer is hidden
			-- unique key for the scratch file is based on:
			-- * name
			-- * ft
			-- * vim.v.count1 (useful for keymaps)
			-- * cwd (optional)
			-- * branch (optional)
			filekey = {
				cwd = true, -- use current working directory
				branch = true, -- use current branch name
				count = true, -- use vim.v.count1
			},
			win = { style = "scratch" },
			---@type table<string, snacks.win.Config>
			win_by_ft = {
				lua = {
					keys = {
						["source"] = {
							"<cr>",
							function(self)
								local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
								Snacks.debug.run({ buf = self.buf, name = name })
							end,
							desc = "Source buffer",
							mode = { "n", "x" },
						},
					},
				},
			},
		},
		scroll = { enabled = true },
		statuscolumn = { enabled = false },
		terminal = {
			win = {
				style = "terminal",
			},
		},
		toggle = {
			map = vim.keymap.set, -- keymap.set function to use
			which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
			enabled = true,
			notify = true, -- show a notification when toggling
			-- icons for enabled/disabled states
			icon = {
				enabled = " ",
				disabled = " ",
			},
			-- colors for enabled/disabled states
			color = {
				enabled = "green",
				disabled = "yellow",
			},
			wk_desc = {
				enabled = "Disable ",
				disabled = "Enable ",
			},
		},
		words = { enabled = true },
		styles = {
			terminal = {
				position = "float",
				backdrop = 60,
				height = 0.9,
				width = 0.9,
				zindex = 50,
				border = "rounded",
				bo = {
					filetype = "snacks_terminal",
				},
				wo = {},
				keys = {
					q = "hide",
					gf = function(self)
						local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
						if f == "" then
							Snacks.notify.warn("No file under cursor")
						else
							self:hide()
							vim.schedule(function()
								vim.cmd("e " .. f)
							end)
						end
					end,
					term_normal = {
						"<esc>",
						function(self)
							self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
							if self.esc_timer:is_active() then
								self.esc_timer:stop()
								vim.cmd("stopinsert")
							else
								self.esc_timer:start(200, 0, function() end)
								return "<esc>"
							end
						end,
						mode = "t",
						expr = true,
						desc = "Double escape to normal mode",
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "[L]azy [G]it",
		},
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal",
		},
		{
			"<c-_>",
			function()
				Snacks.terminal()
			end,
			desc = "which_key_ignore",
		},
		{
			"<leader>n",
			function()
				Snacks.scratch({
					name = "Scratch",
					icon = nil, -- `icon|{icon, icon_hl}`. defaults to the filetype icon
					autowrite = true, -- automatically write when the buffer is hidden
					win = {
						style = "scratch",
						on_win = function()
							vim.cmd("normal! G")
							vim.cmd("normal! $")
						end,
					},
					ft = "markdown",
					file = os.getenv("HOME") .. "/github/Obsidian/Vault/notes/nota-rapida.md",
					-- root = os.getenv("HOME") .. "/github/Obsidian/Vault/notes",
				})
			end,
			desc = "Quick [N]otes",
		},
		{
			"<leader>t",
			function()
				Snacks.scratch({
					name = "Scratch",
					icon = nil, -- `icon|{icon, icon_hl}`. defaults to the filetype icon
					autowrite = true, -- automatically write when the buffer is hidden
					win = {
						style = "scratch",
						on_win = function()
							vim.cmd("normal! G")
							vim.cmd("normal! $")
						end,
					},
					ft = "markdown",
					file = os.getenv("HOME") .. "/github/Obsidian/Vault/notes/lista-todo.md",
					-- root = os.getenv("HOME") .. "/github/Obsidian/Vault/notes",
				})
			end,
			desc = "Quick [T]odos",
		},
	},
}
