return {
	"bullets-vim/bullets.vim",
    desc = "Automated bullet lists",
	ft = { "markdown", "text", "gitcommit", "scratch" },
    init = function()
		vim.g.bullets_delete_last_bullet_if_empty = 1
    end,
}
