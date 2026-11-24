return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- imports icon dependency
		},
		opts = {
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
		},
	},
}
