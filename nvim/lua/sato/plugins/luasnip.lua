return {
	"L3MON4D3/LuaSnip",
    event = "VeryLazy",
	opts = function(_, opts)
		local ls = require("luasnip")
		local extend_decorator = require("luasnip.util.extend_decorator")
		local function auto_semicolon(context)
			if type(context) == "string" then
				return { trig = ";" .. context }
			end
			return vim.tbl_extend("keep", { trig = ";" .. context.trig }, context)
		end
		-- Register and apply decorator properly
		extend_decorator.register(ls.s, {
			arg_indx = 1,
			extend = function(original)
				return auto_semicolon(original)
			end,
		})
		local s = extend_decorator.apply(ls.s, {})

		-- local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node

		local function clipboard()
			return vim.fn.getreg("+")
		end

		-- #####################################################################
		--                            Markdown
		-- #####################################################################

		-- Helper function to create code block snippets
		local function create_code_block_snippet(lang)
			return s({
				trig = lang,
				name = "Codeblock",
				desc = lang .. " codeblock",
			}, {
				t({ "```" .. lang, "" }),
				i(1),
				t({ "", "```" }),
			})
		end

		-- Define languages for code blocks
		local languages = {
			"txt",
			"lua",
			"sql",
			"go",
			"regex",
			"bash",
			"markdown",
			"markdown_inline",
			"yaml",
			"json",
			"jsonc",
			"cpp",
			"csv",
			"java",
			"javascript",
			"python",
			"dockerfile",
			"html",
			"css",
			"templ",
			"php",
		}

		-- Generate snippets for all languages
		local snippets = {}

		for _, lang in ipairs(languages) do
			table.insert(snippets, create_code_block_snippet(lang))
		end

		table.insert(
			snippets,
			s({
				trig = "linkt",
				name = 'Add this -> [](){:target="_blank"}',
				desc = 'Add this -> [](){:target="_blank"}',
			}, {
				t("["),
				i(1),
				t("]("),
				i(2),
				t('){:target="_blank"}'),
			})
		)

		table.insert(
			snippets,
			s({
				trig = "todo",
				name = "Add TODO: item",
				desc = "Add TODO: item",
			}, {
				t("<!-- TODO: "),
				i(1),
				t(" -->"),
			})
		)

		-- Paste clipboard contents in link section, move cursor to ()
		table.insert(
			snippets,
			s({
				trig = "linkc",
				name = "Paste clipboard as .md link",
				desc = "Paste clipboard as .md link",
			}, {
				t("["),
				i(1),
				t("]("),
				f(clipboard, {}),
				t(")"),
			})
		)

		-- Paste clipboard contents in link section, move cursor to ()
		table.insert(
			snippets,
			s({
				trig = "linkex",
				name = "Paste clipboard as EXT .md link",
				desc = "Paste clipboard as EXT .md link",
			}, {
				t("["),
				i(1),
				t("]("),
				f(clipboard, {}),
				t('){:target="_blank"}'),
			})
		)

		-- Basic bash script template
		table.insert(
			snippets,
			s({
				trig = "bashex",
				name = "Basic bash script example",
				desc = "Simple bash script template",
			}, {
				t({
					"```bash",
					"#!/usr/bin/env bash",
					"",
					"echo 'helix'",
					"echo 'deeznuts'",
					"```",
					"",
				}),
			})
		)

		-- Basic Python script template
		table.insert(
			snippets,
			s({
				trig = "pythonex",
				name = "Basic Python script example",
				desc = "Simple Python script template",
			}, {
				t({
					"```python",
					"#!/usr/bin/env python3",
					"",
					"def main():",
					"    print('helix dizpython')",
					"",
					"if __name__ == '__main__':",
					"    main()",
					"```",
					"",
				}),
			})
		)

		ls.add_snippets("markdown", snippets)

		ls.add_snippets("all", {
			s({
				trig = "workflow",
				name = "Add this -> lamw26wmal",
				desc = "Add this -> lamw26wmal",
			}, {
				t("lamw26wmal"),
			}),
		})
        
		return opts
	end,
}
