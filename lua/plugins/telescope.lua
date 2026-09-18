return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-symbols.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fa", function()
			builtin.find_files({ no_ignore = true })
		end, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fe", function()
			builtin.symbols({ sources = { "emoji", "kaomoji", "gitmoji" } })
		end, { desc = "Telescope emojis" })
		vim.keymap.set("i", "<C-<>", function()
			builtin.symbols({ sources = { "emoji", "kaomoji", "gitmoji" } })
		end, { desc = "Telescope emojis" })
	end,
}
