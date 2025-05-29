return {
	"ckolkey/ts-node-action",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>K",
			function()
				require("ts-node-action").node_action()
			end,
			desc = "Trigger Node Action",
			mode = "n",
		},
	},
}
