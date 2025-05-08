return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	opts = {
        preset = "obsidian",
        file_type = { "markdown", "vimwiki" },
        completions = {
            blink = { enabled = true },
        },

		bullet = {
			enabled = true,
		},
		checkbox = {
			enabled = true,
			position = "inline",
			unchecked = {
				icon = "   󰄱 ",
			},
			checked = {
				icon = "   󰱒 ",
			},
		},
		callout = {
			note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo", category = "github", },
			tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess", category = "github", },
			important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint", category = "github", },
			warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn", category = "github", },
			caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError", category = "github", },
			abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo", category = "obsidian", },
			summary = { raw = "[!SUMMARY]", rendered = "󰨸 Summary", highlight = "RenderMarkdownInfo", category = "obsidian", },
			tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo", category = "obsidian", },
			info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo", category = "obsidian", },
			todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo", category = "obsidian", },
			hint = { raw = "[!HINT]", rendered = "󰌶 Hint", highlight = "RenderMarkdownSuccess", category = "obsidian", },
			success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess", category = "obsidian", },
			check = { raw = "[!CHECK]", rendered = "󰄬 Check", highlight = "RenderMarkdownSuccess", category = "obsidian", },
			done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess", category = "obsidian", },
			question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn", category = "obsidian", },
			help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn", category = "obsidian", },
			faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn", category = "obsidian", },
			attention = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn", category = "obsidian", },
			failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError", category = "obsidian", },
			fail = { raw = "[!FAIL]", rendered = "󰅖 Fail", highlight = "RenderMarkdownError", category = "obsidian", },
			missing = { raw = "[!MISSING]", rendered = "󰅖 Missing", highlight = "RenderMarkdownError", category = "obsidian", },
			danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError", category = "obsidian", },
			error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError", category = "obsidian", },
			bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError", category = "obsidian", },
			example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint", category = "obsidian", },
			quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote", category = "obsidian", },
			cite = { raw = "[!CITE]", rendered = "󱆨 Cite", highlight = "RenderMarkdownQuote", category = "obsidian", },
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
            enabled = true,
			sign = true,
            signs = { '󰫎 ' },
			icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
            width = "full",
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
			image = "󰥶 ",
			email = "󰀓 ",
			hyperlink = "󰌹 ",
			highlight = "RenderMarkdownLink",
			wiki = {
				icon = "󱗖 ",
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
