local conform = require("conform")

vim.g.mapleader = " " -- this maps the leader key to the spacebar
-- Oil
vim.keymap.set("n", "<leader>cd", "<cmd>Oil<CR>", { desc = "Open Oil file explorer" })
vim.keymap.set("n", "<leader>Cd", "<cmd>Oil --float<CR>", { desc = "Open Oil file explorer in floating window" })

-- Conform
vim.keymap.set("n", "<leader>fm", function()
	conform.format()
end)

-- Python execute
vim.keymap.set("n", "<leader>p", function()
	vim.cmd("write")
	vim.cmd("!python3 %")
end)

-- faster pane navigation
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>wincmd p<CR>")

-- quick escape
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- luasnip
local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

-- pytest
vim.keymap.set("n", "<leader>tu", "<cmd>PytestUI<CR>")

-- lsp
vim.keymap.set("n", "<leader>le", function()
	vim.diagnostic.open_float({ focusable = true })
end, { desc = "Expand an Error into a float" })
