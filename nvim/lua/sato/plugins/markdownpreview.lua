return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_open_to_the_world = 0
		vim.g.mkdp_open_ip = "127.0.0.1"
		vim.g.mkdp_browser = "firefox"
		vim.g.mkdp_port = 8978
		vim.g.mkdp_echo_preview_url = 1
	end,
	ft = { "markdown" },
	keys = {
		{
			"<leader>mp",
			"<cmd>MarkdownPreviewToggle<cr>",
			mode = "n",
			ft = "markdown",
			desc = "Markdown Preview",
		},
	},
}
