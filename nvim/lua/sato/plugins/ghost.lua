return {
    "subnut/nvim-ghost.nvim",
    lazy = true,
    cmd = { "GhostTextStart", "GhostTextStop" },
    keys = {
        { "<leader>gts", "<cmd>GhostTextStart<CR>", mode = "n", desc = "[G]host [T]ext [S]tart" },
        { "<leader>gtd", "<cmd>GhostTextStop<CR>", mode = "n", desc = "[G]host [T]ext [D]isable" },
    }
}
