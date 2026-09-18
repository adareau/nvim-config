return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event   = "VeryLazy",
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>",      desc = "Terminal: float" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal: horizontal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>",   desc = "Terminal: vertical" },
    { "<leader>t1", "<cmd>1ToggleTerm<cr>",                     desc = "Terminal 1" },
    { "<leader>t2", "<cmd>2ToggleTerm<cr>",                     desc = "Terminal 2" },
    { "<leader>t3", "<cmd>3ToggleTerm<cr>",                     desc = "Terminal 3" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local function set_terminal_keymaps()
      local o = { buffer = 0 }
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]],       o)
      vim.keymap.set("t", "jk",    [[<C-\><C-n>]],       o)
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], o)
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], o)
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], o)
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], o)
      vim.keymap.set("t", "<C-u>", [[<C-\><C-n><C-u>]],  o)
      vim.keymap.set("t", "<C-d>", [[<C-\><C-n><C-d>]],  o)
    end

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern  = "term://*toggleterm#*",
      callback = set_terminal_keymaps,
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit  = Terminal:new({
      cmd       = "lazygit",
      dir       = "git_dir",
      direction = "float",
      hidden    = true,
      float_opts = { border = "curved" },
      on_open   = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(
          term.bufnr, "n", "q",
          "<cmd>close<CR>",
          { noremap = true, silent = true }
        )
      end,
    })

    function _G._LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>gg", "<cmd>lua _G._LAZYGIT_TOGGLE()<CR>", {
      noremap = true,
      silent  = true,
      desc    = "Toggle lazygit",
    })
  end,
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return math.floor(vim.o.columns * 0.4)
      end
    end,
    open_mapping      = [[<C-\>]],
    hide_numbers      = true,
    autochdir         = true,
    start_in_insert   = true,
    insert_mappings   = true,
    terminal_mappings = true,
    persist_size      = true,
    persist_mode      = true,
    direction         = "float",
    close_on_exit     = true,
    shell             = vim.o.shell,
    auto_scroll       = true,
    float_opts = {
      border   = "curved",
      winblend = 0,
    },
  },
}
