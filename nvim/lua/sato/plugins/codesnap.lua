return {
	"mistricky/codesnap.nvim",
	build = "make",
	keys = {
		{ "<leader>cs", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{ "<leader>css", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		{ "<leader>csa", "<cmd>CodeSnapASCII<cr>", mode = "x", desc = "Save selected code snapshot in ASCII format" },
	},
	opts = {
		save_path = "~/Imagens/Codesnap",
		has_breadcrumbs = true,
		bg_theme = "bamboo",
        watermark = "",
        bg_padding = 0,
	},
}

