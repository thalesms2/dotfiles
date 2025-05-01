return {
	{
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			-- Better Around/Inside textobjects
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			local ai = require("mini.ai")
			ai.setup({
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					g = ai.ai_buffer, -- buffer
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.statusline",
		version = "*",
        enabled = false,
		config = function()
			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = true, terminal = true },
			})
		end,
	},
	{
		"echasnovski/mini.files",
		version = "*",
		enabled = false,
		opts = function(_, opts)
			-- I didn't like the default mappings, so I modified them
			-- Module mappings created only inside explorer.
			-- Use `''` (empty string) to not create one.
			opts.mappings = vim.tbl_deep_extend("force", opts.mappings or {}, {
				close = "<esc>",
				-- Use this if you want to open several files
				go_in = "l",
				-- This opens the file, but quits out of mini.files (default L)
				go_in_plus = "<CR>",
				-- I swapped the following 2 (default go_out: h)
				-- go_out_plus: when you go out, it shows you only 1 item to the right
				-- go_out: shows you all the items to the right
				go_out = "H",
				go_out_plus = "h",
				-- Default <BS>
				reset = "<BS>",
				-- Default @
				reveal_cwd = ".",
				show_help = "g?",
				-- Default =
				synchronize = "s",
				trim_left = "<",
				trim_right = ">",

				-- Below I created an autocmd with the "," keymap to open the highlighted
				-- directory in a tmux pane on the right
			})

			-- Here I define my custom keymaps in a centralized place
			opts.custom_keymaps = {
				open_tmux_pane = "<M-t>",
				copy_to_clipboard = "<space>yy",
				zip_and_copy = "<space>yz",
				paste_from_clipboard = "<space>p",
				copy_path = "<M-c>",
				-- Don't use "i" as it conflicts wit insert mode
				preview_image = "<space>i",
				preview_image_popup = "<M-i>",
			}

			opts.windows = vim.tbl_deep_extend("force", opts.windows or {}, {
				preview = true,
				width_focus = 30,
				width_preview = 80,
			})

			opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
				-- Whether to use for editing directories
				-- Disabled by default in LazyVim because neo-tree is used for that
				use_as_default_explorer = true,
				-- If set to false, files are moved to the trash directory
				-- To get this dir run :echo stdpath('data')
				-- ~/.local/share/neobean/mini.files/trash
				permanent_delete = false,
			})
			return opts
		end,

		keys = {
			{
				-- Open the directory of the file currently being edited
				-- If the file doesn't exist because you maybe switched to a new git branch
				-- open the current working directory
				"<leader>e",
				function()
					local buf_name = vim.api.nvim_buf_get_name(0)
					local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
					if vim.fn.filereadable(buf_name) == 1 then
						-- Pass the full file path to highlight the file
						require("mini.files").open(buf_name, true)
					elseif vim.fn.isdirectory(dir_name) == 1 then
						-- If the directory exists but the file doesn't, open the directory
						require("mini.files").open(dir_name, true)
					else
						-- If neither exists, fallback to the current working directory
						require("mini.files").open(vim.uv.cwd(), true)
					end
				end,
				desc = "Open mini.files (Directory of Current File or CWD if not exists)",
			},
			-- Open the current working directory
			{
				"<leader>E",
				function()
					require("mini.files").open(vim.uv.cwd(), true)
				end,
				desc = "Open mini.files (cwd)",
			},
		},

		config = function(_, opts)
			-- Set up mini.files
			require("mini.files").setup(opts)
			-- Load custom keymaps
			mini_files_km.setup(opts)

			-- Load Git integration
			-- git config is slowing mini.files too much, so disabling it
			mini_files_git.setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		enabled = false,
		event = "LazyFile",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"echasnovski/mini.icons",
		lazy = true,
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
				["bash.tmpl"] = { glyph = "", hl = "MiniIconsGrey" },
				["json.tmpl"] = { glyph = "", hl = "MiniIconsGrey" },
				["ps1.tmpl"] = { glyph = "󰨊", hl = "MiniIconsGrey" },
				["sh.tmpl"] = { glyph = "", hl = "MiniIconsGrey" },
				["toml.tmpl"] = { glyph = "", hl = "MiniIconsGrey" },
				["yaml.tmpl"] = { glyph = "", hl = "MiniIconsGrey" },
				["zsh.tmpl"] = { glyph = "", hl = "MiniIconsGrey" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		version = "*",
		config = function()
			local hi = require("mini.hipatterns")
			hi.setup({
				tailwind = {
					enabled = true,
					ft = {
						"astro",
						"css",
						"heex",
						"html",
						"html-eex",
						"javascript",
						"javascriptreact",
						"rust",
						"svelte",
						"typescript",
						"typescriptreact",
						"vue",
					},
					-- full: the whole css class will be highlighted
					-- compact: only the color will be highlighted
					style = "full",
				},
				highlighters = {
					hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
					shorthand = {
						pattern = "()#%x%x%x()%f[^%x%w]",
						group = function(_, _, data)
							---@type string
							local match = data.full_match
							local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
							local hex_color = "#" .. r .. r .. g .. g .. b .. b

							return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
						end,
						extmark_opts = { priority = 2000 },
					},
				},
			})
		end,
	},
}
