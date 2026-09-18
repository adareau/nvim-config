-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.options")
require("config.lazy")
require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
})
require("oil").setup({
	view_options = {
		show_hidden = true,
		is_hidden_file = function(name, bufnr)
			return name ~= ".." and vim.startswith(name, ".")
		end,
	},
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "black" },
		html = { "djlint" },
	},
})
require("outline").setup({})
require("config.keybinds")

-- setup colorscheme
vim.cmd("colorscheme catppuccin-frappe")

-- setup lualine
require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_x = {
			function()
				return os.date("⟨ %H:%M")
			end,
		},
	},

})

