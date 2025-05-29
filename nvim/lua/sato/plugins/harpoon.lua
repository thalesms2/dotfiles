return {
	"Theprimeagen/harpoon",
    event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
        require("which-key").add({
            { "<leader>a", function() harpoon:list():add() end, desc = "Harpoon: add", mode = "n", icon = "󰹡 " },
            { "<leader>1", function() harpoon:list():select(1) end, desc = "Harpoon: Go to 1", hidden = true},
            { "<leader>2", function() harpoon:list():select(2) end, desc = "Harpoon: Go to 2", hidden = true},
            { "<leader>3", function() harpoon:list():select(3) end, desc = "Harpoon: Go to 3", hidden = true},
            { "<leader>4", function() harpoon:list():select(4) end, desc = "Harpoon: Go to 4", hidden = true},
            { "<leader>5", function() harpoon:list():select(5) end, desc = "Harpoon: Go to 5", hidden = true},
            { "<leader>6", function() harpoon:list():select(6) end, desc = "Harpoon: Go to 6", hidden = true},
            { "<leader>7", function() harpoon:list():select(7) end, desc = "Harpoon: Go to 7", hidden = true},
            { "<leader>8", function() harpoon:list():select(8) end, desc = "Harpoon: Go to 8", hidden = true},
            { "<leader>9", function() harpoon:list():select(9) end, desc = "Harpoon: Go to 9", hidden = true},
            { "<leader>0", function() harpoon:list():select(0) end, desc = "Harpoon: Go to 10", hidden = true},
            { "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon: show list", icon = "", group = "Harpoon"},
            { "<C-S-P>", function() harpoon:list():prev() end, desc = "Harpoon: previous buffer", icon = "", group = "Harpoon"},
            { "<C-S-N>", function() harpoon:list():next() end, desc = "Harpoon: next buffer", icon = "", group = "Harpoon"},
        })
	end,
}
