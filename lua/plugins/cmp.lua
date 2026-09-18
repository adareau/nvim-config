return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",  -- LSP completions
    "hrsh7th/cmp-buffer",    -- buffer words
    "hrsh7th/cmp-path",      -- filesystem paths
    "hrsh7th/cmp-cmdline",   -- command-line completions
    "L3MON4D3/LuaSnip",      -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "rafamadriz/friendly-snippets", -- snippet collection
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    -- AJOUT : Charge friendly-snippets ET vos snippets personnalisés au démarrage de cmp
    local vscode_loader = require("luasnip.loaders.from_vscode")
    vscode_loader.lazy_load() -- Charge friendly-snippets
    vscode_loader.lazy_load({ 
      paths = { vim.fn.stdpath("config") .. "/snippets" } 
    }) -- Charge votre dossier local

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end
}
