return {
	"gbprod/yanky.nvim",
	recommended = true,
	desc = "Better Yank/Paste",
	opts = {
		ring = {
			history_length = 100,
			storage = "shada",
			storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
			sync_with_numbered_registers = true,
			cancel_event = "update",
			ignore_registers = { "_" },
			update_register_on_cycle = false,
			permanent_wrapper = nil,
		},
		picker = {
			select = {
				action = nil, -- nil to use default put action
			},
			telescope = {
				use_default_mappings = true, -- if default mappings should be used
				mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
			},
		},
		system_clipboard = {
			sync_with_ring = true,
			clipboard_register = nil,
		},
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 200,
		},
		preserve_cursor_position = {
			enabled = true,
		},
		textobj = {
			enabled = false,
		},
	},
	keys = {
		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
		{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put Text After Selection" },
		{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Selection" },
		{ "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
		{ "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
		{ "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
		{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
		{ "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
		{ "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
		{ ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right" },
		{ "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left" },
		{ ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
		{ "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left" },
		{ "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" },
		{ "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" },
	},
}
