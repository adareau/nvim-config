return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Optionnel mais fortement recommandé pour les icônes
  },
  config = function()
    -- Recommandé par la documentation officielle d'nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Configuration de nvim-tree
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      git = {
	ignore = false
      },
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })

    -- Raccourci clavier pour ouvrir/fermer l'arbre (Toggle)
    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
    vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTree on current file" })
  end,
}

