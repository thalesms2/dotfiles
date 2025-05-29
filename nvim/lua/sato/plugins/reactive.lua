return {
	"rasulomaroff/reactive.nvim",
    event = "VeryLazy",
	desc = "highlights on mode changes and much more",
	config = function()
		require("reactive").setup({
			builtin = {
				cursorline = true,
				cursor = true,
				modemsg = true,
			},
		})
	end,
}
