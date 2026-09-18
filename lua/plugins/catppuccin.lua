return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        transparent_background = false, -- disables setting the background color
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = { enabled = true },
        },
      })
      -- -- Load the colorscheme
      -- vim.cmd.colorscheme("catppuccin")
    end,
  }
}

