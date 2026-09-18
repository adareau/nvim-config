return {
  'nvim-treesitter/nvim-treesitter',
  branch = "master",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autoage = { enable = true },
      ensure_installed = {
        "lua", "ruby", "tsx", "typescript", "vim", "html", "javascript", "query", "vimdoc", "python" -- add whatever coding language that you use in your day-to-day
      },
      auto_install = false,
    })
  end
}
