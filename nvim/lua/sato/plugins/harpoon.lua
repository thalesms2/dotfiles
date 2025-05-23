return {
	"Theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
        require("which-key").add({
            { "<leader>a", function() harpoon:list():add() end, desc = "Harpoon: add", mode = "n" },
            { "<leader>1", function() harpoon:list():select(1) end, desc = "Harpoon: Go to 1"},
        })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: show list" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: go to 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: go to 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: go to 4" })
		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Harpoon: go to 5" })
		vim.keymap.set("n", "<leader>6", function()
			harpoon:list():select(6)
		end, { desc = "Harpoon: go to 6" })
		vim.keymap.set("n", "<leader>7", function()
			harpoon:list():select(7)
		end, { desc = "Harpoon: go to 7" })
		vim.keymap.set("n", "<leader>8", function()
			harpoon:list():select(8)
		end, { desc = "Harpoon: go to 8" })
		vim.keymap.set("n", "<leader>9", function()
			harpoon:list():select(9)
		end, { desc = "Harpoon: go to 9" })
		vim.keymap.set("n", "<leader>0", function()
			harpoon:list():select(0)
		end, { desc = "Harpoon: go to 10" })
		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: previous buffer" })
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Harpoon: next buffer" })
	end,
}
