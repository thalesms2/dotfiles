return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>out", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		symbol_folding = {
			-- Unfold entire symbol tree by default with false, otherwise enter a
			-- number starting from 1
			autofold_depth = false,
			-- autofold_depth = 1,
		},
		outline_window = {
			-- Percentage or integer of columns
			width = 33,
		},
	},
}
