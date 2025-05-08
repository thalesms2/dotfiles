return { -- Autoformat
	"stevearc/conform.nvim",
	lazy = true,
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "n",
			desc = "[C]onform [F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},

}
