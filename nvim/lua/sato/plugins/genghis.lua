return {
	"chrisgrieser/nvim-genghis",
	opts = function()
        local gg = require("genghis")
		require("which-key").add({
			{ "<leader>fN", function() gg.createNewFile() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fd", function() gg.duplicateFile() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fsn", function() gg.moveSelectionToNewFile() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fr", function() gg.renameFile() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fmr", function() gg.moveAndRenameFile() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fmc", function() gg.moveToFolderInCwd() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fC", function() gg.chmodx() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fD", function() gg.trashFile() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fo", function() gg.showInSystemExplorer() end, desc = "[S]earch [H]elp", mode = "n", },

			{ "<leader>fcn", function() gg.copyFilename() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fcp", function() gg.copyFilepath() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fcP", function() gg.copyFilepathWithTilde() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fcr", function() gg.copyRelativePath() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fcd", function() gg.copyRelativeDirectoryPath() end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fcf", function() gg.copyFileItself() end, desc = "[S]earch [H]elp", mode = "n", },

			{ "<leader>fn", function() gg.navigateToFileInFolder("next") end, desc = "[S]earch [H]elp", mode = "n", },
			{ "<leader>fp", function() gg.navigateToFileInFolder("prev") end, desc = "[S]earch [H]elp", mode = "n", },
        })

        return {
		icons = {
			chmodx = "󰒃",
			copyFile = "󱉥",
			copyPath = "󰅍",
			duplicate = "",
			file = "󰈔",
			move = "󰪹",
			new = "󰝒",
			nextFile = "󰖽",
			prevFile = "󰖿",
			rename = "󰑕",
			trash = "󰩹",
		},
	}
end,
}
