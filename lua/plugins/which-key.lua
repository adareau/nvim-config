-- Which-key : affiche les raccourcis disponibles
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup()
	end,
}
