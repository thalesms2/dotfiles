return {
	"bullets-vim/bullets.vim",
	ft = { "markdown", "text", "gitcommit", "scratch" },
	config = function()
		vim.g.bullets_delete_last_bullet_if_empty = 1
	end,
}
