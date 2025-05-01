return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts_extend = { "spec" },
	opts = {
		preset = "helix",
		delay = 0,
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
			ellipsis = "…",
			-- set to false to disable all mapping icons,
			-- both those explicitly added in a mapping
			-- and those from rules
			--- See `lua/which-key/icons.lua` for more details
			--- Set to `false` to disable keymap icons from rules
			---@type wk.IconRule[]|false
			rules = {},
			-- use the highlights from mini.icons
			-- When `false`, it will use `WhichKeyIcon` instead
			colors = true,
			mappings = vim.g.have_nerd_font,
			keys = vim.g.have_nerd_font and {} or {
				up = " ",
				down = " ",
				left = " ",
				right = " ",
				c = "󰘴 ",
				m = "󰘵 ",
				d = "󰘳 ",
				s = "󰘶 ",
				cr = "󰌑 ",
				esc = "󱊷 ",
				scrollwheeldown = "󱕐 ",
				scrollwheelup = "󱕑 ",
				nl = "󰌑 ",
				BS = "󰁮",
				Space = "󱁐 ",
				Tab = "󰌒 ",
				F1 = "󱊫",
				F2 = "󱊬",
				F3 = "󱊭",
				F4 = "󱊮",
				F5 = "󱊯",
				F6 = "󱊰",
				F7 = "󱊱",
				F8 = "󱊲",
				F9 = "󱊳",
				F10 = "󱊴",
				F11 = "󱊵",
				F12 = "󱊶",
			},
		},
		spec = {
			{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
			{ "<leader>d", group = "[D]ocument" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			-- { "<leader><tab>", group = "tabs" },
			-- { "<leader>c", group = "code" },
			-- { "<leader>d", group = "debug" },
			-- { "<leader>dp", group = "profiler" },
			-- { "<leader>f", group = "file/find" },
			-- { "<leader>g", group = "git" },
			-- { "<leader>gh", group = "hunks" },
			-- { "<leader>q", group = "quit/session" },
			-- { "<leader>s", group = "search" },
			-- { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
			-- { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
			-- { "[", group = "prev" },
			-- { "]", group = "next" },
			-- { "g", group = "goto" },
			-- { "gs", group = "surround" },
			-- { "z", group = "fold" },
			-- {
			--   "<leader>b",
			--   group = "buffer",
			--   expand = function()
			--     return require("which-key.extras").expand.buf()
			--   end,
			-- },
			-- {
			--   "<leader>w",
			--   group = "windows",
			--   proxy = "<c-w>",
			--   expand = function()
			--     return require("which-key.extras").expand.win()
			--   end,
			-- },
			-- better descriptions
			{ "gx", desc = "Open with system app" },
		},
		notify = true,
		triggers = {
			-- { "<auto>", mode = "nxso" },
			{ "<auto>", mode = "nivctxso" },
		},
		-- Start hidden and wait for a key to be pressed before showing the popup
		-- Only used by enabled xo mapping modes.
		---@param ctx { mode: string, operator: string }
		defer = function(ctx)
			return ctx.mode == "V" or ctx.mode == "<C-V>"
		end,
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			presets = {
				operators = true, -- adds help for operators like d, y, ...
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		win = {
			-- don't allow the popup to overlap with the cursor
			no_overlap = true,
			-- width = 1,
			-- height = { min = 4, max = 25 },
			-- col = 0,
			-- row = math.huge,
			-- border = "none",
			padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
			title = true,
			title_pos = "center",
			zindex = 1000,
			-- Additional vim.wo and vim.bo options
			bo = {},
			wo = {
				-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			},
		},
		layout = {
			width = { min = 20 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
		},
		keys = {
			scroll_down = "<M-d>", -- binding to scroll down inside the popup
			scroll_up = "<M-u>", -- binding to scroll up inside the popup
		},
		---@type (string|wk.Sorter)[]
		--- Mappings are sorted using configured sorters and natural sort of the keys
		--- Available sorters:
		--- * local: buffer-local mappings first
		--- * order: order of the items (Used by plugins like marks / registers)
		--- * group: groups last
		--- * alphanum: alpha-numerical first
		--- * mod: special modifier keys last
		--- * manual: the order the mappings were added
		--- * case: lower-case first
		sort = { "local", "order", "group", "alphanum", "mod" },
		-- Functions/Lua Patterns for formatting the labels
		---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
		replace = {
			key = {
				function(key)
					return require("which-key.view").format(key)
				end,
				-- { "<Space>", "SPC" },
			},
			desc = {
				{ "<Plug>%(?(.*)%)?", "%1" },
				{ "^%+", "" },
				{ "<[cC]md>", "" },
				{ "<[cC][rR]>", "" },
				{ "<[sS]ilent>", "" },
				{ "^lua%s+", "" },
				{ "^call%s+", "" },
				{ "^:%s*", "" },
			},
		},
		show_help = true, -- show a help message in the command line for using WhichKey
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
		-- disable WhichKey for certain buf types and file types.
		disable = {
			ft = {},
			bt = {},
		},
		debug = false, -- enable wk.log in the current directory
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true })
			end,
			desc = "Buffer Keymaps (which-key)",
		},
		{
			"<c-w><space>",
			function()
				require("which-key").show({ keys = "<c-w>", loop = true })
			end,
			desc = "Window Hydra Mode (which-key)",
		},
	},
}
