return {
	"akinsho/toggleterm.nvim",
	version = "*",
    event = "VeryLazy",
	opts = {--[[ things you want to change go here]]
	},
	config = function()
		require("toggleterm").setup({
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			hide_numbers = true, -- hide the number column in toggleterm buffers
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			direction = "float",
			auto_scroll = true, -- automatically scroll to the bottom on terminal output
			-- This field is only relevant if direction is set to 'float'
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = "curved",
				-- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
				width = 400,
				height = 200,
				row = 5,
				col = 3,
				winblend = 3,
				zindex = 10,
				title_pos = "left",
			},
			winbar = {
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
			responsiveness = {
				-- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
				-- instead of next to each other
				-- default = 0 which means the feature is turned off
				horizontal_breakpoint = 135,
			},
		})
	end,
}
