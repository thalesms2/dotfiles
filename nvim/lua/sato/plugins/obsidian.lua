return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	event = "VeryLazy",
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "Vault",
					path = "~/github/Obsidian/Vault",
				},
				{
					name = "Pessoal",
					path = "~/github/Obsidian/Root",
				},
			},
			notes_subdir = "notes",
			daily_notes = {
				folder = "notes/dailies",
				date_format = "%Y-%m-%d",
				default_tags = { "daily" },
				template = "daily",
			},
			completion = {
				nvim_cmp = true,
			},
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle check-boxes.
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				-- Smart action depending on context: follow link, show notes with tag, or toggle checkbox.
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},
			new_notes_location = "notes_subdir",
			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					suffix = "new-note"
				end
				return suffix
			end,
			note_path_func = function(spec)
				local path = spec.dir / tostring(spec.id)
				return path:with_suffix(".md")
			end,
			-- Optional, boolean or a function that takes a filename and returns a boolean.
			-- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
			disable_frontmatter = false,

			-- Optional, alternatively you can customize the frontmatter data.
			note_frontmatter_func = function(note)
				-- Add the title of the note as an alias.
				if note.title then
					note:add_alias(note.title)
				end

				local out = { id = note.id, aliases = note.aliases, tags = note.tags }

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,
			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function
				substitutions = {},
			},
			follow_url_func = function(url)
				vim.ui.open(url) -- need Neovim 0.10.0+
			end,
			-- follow_img_func = function(img)
			-- 	vim.fn.jobstart({ "xdg-open", img }) -- linux
			-- end,
			picker = {
				name = "telescope.nvim",
				note_mappings = {
					-- Create a new note from your query.
					new = "<C-x>",
					-- Insert a link to the selected note.
					insert_link = "<C-l>",
				},
				tag_mappings = {
					-- Add tag(s) to current note.
					tag_note = "<C-x>",
					-- Insert a tag at the current location.
					insert_tag = "<C-l>",
				},
			},
			-- Optional, sort search results by "path", "modified", "accessed", or "created".
			-- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
			-- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
			sort_by = "modified",
			sort_reversed = true,
			-- Optional, determines how certain commands open notes. The valid options are:
			-- 1. "current" (the default) - to always open in the current window
			-- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
			-- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
			open_notes_in = "current",

			-- Optional, define your own callbacks to further customize behavior.
			callbacks = {
				-- Runs at the end of `require("obsidian").setup()`.
				---@param client obsidian.Client
				post_setup = function(client) end,

				-- Runs anytime you enter the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				enter_note = function(client, note) end,

				-- Runs anytime you leave the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				leave_note = function(client, note) end,

				-- Runs right before writing the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				pre_write_note = function(client, note) end,

				-- Runs anytime the workspace is set/changed.
				---@param client obsidian.Client
				---@param workspace obsidian.Workspace
				post_set_workspace = function(client, workspace) end,
			},
			ui = {
				enable = false,
			},
			attachments = {
				-- The default folder to place images in via `:ObsidianPasteImg`.
				-- If this is a relative path it will be interpreted as relative to the vault root.
				-- You can always override this per image by passing a full path to the command instead of just a filename.
				img_folder = "assets/imgs", -- This is the default

				-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
				---@return string
				img_name_func = function()
					-- Prefix image names with timestamp.
					return string.format("%s-", os.time())
				end,

				-- A function that determines the text to insert in the note when pasting an image.
				-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
				-- This is the default implementation.
				---@param client obsidian.Client
				---@param path obsidian.Path the absolute path to the image file
				---@return string
				img_text_func = function(client, path)
					path = client:vault_relative_path(path) or path
					return string.format("![%s](%s)", path.name, path)
				end,
			},
		})

		vim.keymap.set("n", "<leader>sO", "<cmd>ObsidianQuickSwitch<cr>", { desc = "[S]earch [O]bsidian files" })
		vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<cr>", { desc = "[O]bsidian change [W]orkspace" })
		vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "[O]bsidian [N]ew file" })
		vim.keymap.set("n", "<leader>so", "<cmd>ObsidianSearch<cr>", { desc = "[S]earch by grep in [O]bsidian files" })
        vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "[O]bsidian: List [L]inks on file" })
        vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<cr>", { desc = "[O]bsidian: List [D]ailies notes" })
        vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianNewFromTemplate<cr>", { desc = "[O]bsidian: Create new from [T]emplate" })
        vim.keymap.set("n", "<leader>oT", "<cmd>ObsidianTemplate<cr>", { desc = "[O]bsidian: List [T]emplates" })

		vim.keymap.set("n", "<leader>oO", "<cmd>ObsidianOpen<cr>", { desc = "[O]bsidian: [O]pen file on obsidian" })
		vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "[O]bsidian: List [B]acklinks" })
		vim.keymap.set("n", "<leader>o.", "<cmd>ObsidianTags<cr>", { desc = "[O]bsidian: List tags" })

		vim.keymap.set("n", "<leader>o2", "<cmd>ObsidianToday<cr>", { desc = "[O]bsidian: " })
		vim.keymap.set("n", "<leader>o1", "<cmd>ObsidianYesterday<cr>", { desc = "[O]bsidian: " })
		vim.keymap.set("n", "<leader>o3", "<cmd>ObsidianTomorrow<cr>", { desc = "[O]bsidian: " })

		vim.keymap.set("v", "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { desc = "[O]bsidian: [E]xtract notes" })
		vim.keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<cr>", { desc = "[O]bsidian: [P]aste image" })
		vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "[O]bsidian: [R]ename file" })
		vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianTOC<cr>", { desc = "[O]bsidian: [O]bjects" })
	end,
}
