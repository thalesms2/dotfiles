return {
	"lmantw/themify.nvim",
	lazy = false,
	priority = 999,
	opts = {
		{
			"EdenEast/nightfox.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			config = function()
				require("nightfox").setup({
					options = {
						-- Compiled file's destination location
						compile_path = vim.fn.stdpath("cache") .. "/nightfox",
						compile_file_suffix = "_compiled", -- Compiled file suffix
						transparent = false, -- Disable setting background
						terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
						dim_inactive = false, -- Non focused panes set to alternative background
						module_default = true, -- Default enable value for modules
						colorblind = {
							enable = false, -- Enable colorblind support
							simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
							severity = {
								protan = 0, -- Severity [0,1] for protan (red)
								deutan = 0, -- Severity [0,1] for deutan (green)
								tritan = 0, -- Severity [0,1] for tritan (blue)
							},
						},
						styles = { -- Style to be applied to different syntax groups
							comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
							conditionals = "NONE",
							constants = "NONE",
							functions = "NONE",
							keywords = "NONE",
							numbers = "NONE",
							operators = "NONE",
							strings = "NONE",
							types = "NONE",
							variables = "NONE",
						},
						inverse = { -- Inverse highlight for different types
							match_paren = false,
							visual = false,
							search = false,
						},
						modules = { -- List of various plugins and additional options
							-- ...
						},
					},
					palettes = {},
					specs = {},
					groups = {},
				})
			end,
		},
		{
			"olimorris/onedarkpro.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"sho-87/kanagawa-paper.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"comfysage/evergarden",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			branch = "mega",
		},
		{
			"ellisonleao/gruvbox.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			config = function()
				require("gruvbox").setup({
					terminal_colors = true, -- add neovim terminal colors
					undercurl = true,
					underline = false,
					bold = true,
					italic = {
						strings = false,
						emphasis = false,
						comments = false,
						operators = false,
						folds = false,
					},
					strikethrough = true,
					invert_selection = false,
					invert_signs = false,
					invert_tabline = false,
					invert_intend_guides = false,
					inverse = true, -- invert background for search, diffs, statuslines and errors
					contrast = "", -- can be "hard", "soft" or empty string
					palette_overrides = {},
					overrides = {},
					dim_inactive = false,
					transparent_mode = false,
				})
			end,
		},
		{
			"folke/tokyonight.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			config = function()
				require("tokyonight").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
					transparent = true, -- Enable this to disable setting the background color
					terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
					styles = {
						-- Style to be applied to different syntax groups
						-- Value is any valid attr-list value for `:help nvim_set_hl`
						comments = { italic = false },
						keywords = { italic = false },
						-- Background styles. Can be "dark", "transparent" or "normal"
						sidebars = "dark", -- style for sidebars, see below
						floats = "dark", -- style for floating windows
					},
				})
			end,
		},
		{
			"rose-pine/neovim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			config = function()
				require("rose-pine").setup({
					disable_background = true,
					styles = {
						italic = false,
					},
				})
			end,
		},
		{
			"sontungexpt/witch",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"catppuccin/nvim",
			opts = {
				integrations = {
					aerial = true,
					alpha = true,
					cmp = true,
					dashboard = true,
					flash = true,
					fzf = true,
					grug_far = true,
					gitsigns = true,
					headlines = true,
					illuminate = true,
					indent_blankline = { enabled = true },
					leap = true,
					lsp_trouble = true,
					mason = true,
					markdown = true,
					mini = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					navic = { enabled = true, custom_bg = "lualine" },
					neotest = true,
					neotree = true,
					noice = true,
					notify = true,
					semantic_tokens = true,
					snacks = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					which_key = true,
				},
			},
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{
			"scottmckendry/cyberdream.nvim",
			after = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
			config = function()
				require("cyberdream").setup({
					transparent = true,
					bordeless_pickers = true,
					terminal_colors = true,
					extensions = {
						telescope = true,
						mini = true,
					},
				})
			end,
		},
		"default",
	},
}
