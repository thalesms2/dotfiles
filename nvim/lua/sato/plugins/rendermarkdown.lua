return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	priority = 1000,
	opts = {
		bullet = {
			-- Turn on / off list bullet rendering
			enabled = true,
		},
		checkbox = {
			-- Turn on / off checkbox state rendering
			enabled = true,
			-- Determines how icons fill the available space:
			--  inline:  underlying text is concealed resulting in a left aligned icon
			--  overlay: result is left padded with spaces to hide any additional text
			position = "inline",
			unchecked = {
				-- Replaces '[ ]' of 'task_list_marker_unchecked'
				icon = "   󰄱 ",
				-- Highlight for the unchecked icon
				-- highlight = "RenderMarkdownUnchecked",
				-- Highlight for item associated with unchecked checkbox
				-- scope_highlight = nil,
			},
			checked = {
				-- Replaces '[x]' of 'task_list_marker_checked'
				icon = "   󰱒 ",
				-- Highlight for the checked icon
				-- highlight = "RenderMarkdownChecked",
				-- Highlight for item associated with checked checkbox
				-- scope_highlight = nil,
			},
		},
		callout = {
			note = {
				raw = "[!NOTE]",
				rendered = "󰋽 Note",
				highlight = "RenderMarkdownInfo",
				category = "github",
			},
			tip = {
				raw = "[!TIP]",
				rendered = "󰌶 Tip",
				highlight = "RenderMarkdownSuccess",
				category = "github",
			},
			important = {
				raw = "[!IMPORTANT]",
				rendered = "󰅾 Important",
				highlight = "RenderMarkdownHint",
				category = "github",
			},
			warning = {
				raw = "[!WARNING]",
				rendered = "󰀪 Warning",
				highlight = "RenderMarkdownWarn",
				category = "github",
			},
			caution = {
				raw = "[!CAUTION]",
				rendered = "󰳦 Caution",
				highlight = "RenderMarkdownError",
				category = "github",
			},
			abstract = {
				raw = "[!ABSTRACT]",
				rendered = "󰨸 Abstract",
				highlight = "RenderMarkdownInfo",
				category = "obsidian",
			},
			summary = {
				raw = "[!SUMMARY]",
				rendered = "󰨸 Summary",
				highlight = "RenderMarkdownInfo",
				category = "obsidian",
			},
			tldr = {
				raw = "[!TLDR]",
				rendered = "󰨸 Tldr",
				highlight = "RenderMarkdownInfo",
				category = "obsidian",
			},
			info = {
				raw = "[!INFO]",
				rendered = "󰋽 Info",
				highlight = "RenderMarkdownInfo",
				category = "obsidian",
			},
			todo = {
				raw = "[!TODO]",
				rendered = "󰗡 Todo",
				highlight = "RenderMarkdownInfo",
				category = "obsidian",
			},
			hint = {
				raw = "[!HINT]",
				rendered = "󰌶 Hint",
				highlight = "RenderMarkdownSuccess",
				category = "obsidian",
			},
			success = {
				raw = "[!SUCCESS]",
				rendered = "󰄬 Success",
				highlight = "RenderMarkdownSuccess",
				category = "obsidian",
			},
			check = {
				raw = "[!CHECK]",
				rendered = "󰄬 Check",
				highlight = "RenderMarkdownSuccess",
				category = "obsidian",
			},
			done = {
				raw = "[!DONE]",
				rendered = "󰄬 Done",
				highlight = "RenderMarkdownSuccess",
				category = "obsidian",
			},
			question = {
				raw = "[!QUESTION]",
				rendered = "󰘥 Question",
				highlight = "RenderMarkdownWarn",
				category = "obsidian",
			},
			help = {
				raw = "[!HELP]",
				rendered = "󰘥 Help",
				highlight = "RenderMarkdownWarn",
				category = "obsidian",
			},
			faq = {
				raw = "[!FAQ]",
				rendered = "󰘥 Faq",
				highlight = "RenderMarkdownWarn",
				category = "obsidian",
			},
			attention = {
				raw = "[!ATTENTION]",
				rendered = "󰀪 Attention",
				highlight = "RenderMarkdownWarn",
				category = "obsidian",
			},
			failure = {
				raw = "[!FAILURE]",
				rendered = "󰅖 Failure",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			fail = {
				raw = "[!FAIL]",
				rendered = "󰅖 Fail",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			missing = {
				raw = "[!MISSING]",
				rendered = "󰅖 Missing",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			danger = {
				raw = "[!DANGER]",
				rendered = "󱐌 Danger",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			error = {
				raw = "[!ERROR]",
				rendered = "󱐌 Error",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			bug = {
				raw = "[!BUG]",
				rendered = "󰨰 Bug",
				highlight = "RenderMarkdownError",
				category = "obsidian",
			},
			example = {
				raw = "[!EXAMPLE]",
				rendered = "󰉹 Example",
				highlight = "RenderMarkdownHint",
				category = "obsidian",
			},
			quote = {
				raw = "[!QUOTE]",
				rendered = "󱆨 Quote",
				highlight = "RenderMarkdownQuote",
				category = "obsidian",
			},
			cite = {
				raw = "[!CITE]",
				rendered = "󱆨 Cite",
				highlight = "RenderMarkdownQuote",
				category = "obsidian",
			},
		},
		html = {
			-- Turn on / off all HTML rendering
			enabled = true,
			comment = {
				-- Turn on / off HTML comment concealing
				conceal = false,
			},
		},
		heading = {
			sign = false,
			icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
		},
		link = {
			enabled = true,
			render_modes = false,
			footnote = {
				enabled = true,
				superscript = true,
				prefix = "",
				suffix = "",
			},
			image = vim.g.neovim_mode == "skitty" and "" or "󰥶 ",
			email = "󰀓 ",
			hyperlink = "󰌹 ",
			highlight = "RenderMarkdownLink",
			wiki = {
				icon = "󱗖 ",
				body = function()
					return nil
				end,
				highlight = "RenderMarkdownWikiLink",
			},
			custom = {
				web = { pattern = "^http", icon = "󰖟 " },
				discord = { pattern = "discord%.com", icon = "󰙯 " },
				github = { pattern = "github%.com", icon = "󰊤 " },
				gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
				google = { pattern = "google%.com", icon = "󰊭 " },
				neovim = { pattern = "neovim%.io", icon = " " },
				reddit = { pattern = "reddit%.com", icon = "󰑍 " },
				stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
				wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
				youtube = { pattern = "youtube%.com", icon = "󰗃 " },
			},
		},
	},
}
