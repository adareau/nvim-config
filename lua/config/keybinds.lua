local conform = require("conform")

-- Define leader key
vim.g.mapleader = " " -- this maps the leader key to the spacebar

-- Shorthand
local map = vim.keymap.set

-- Confort 
-- https://www.stephane-robert.info/docs/admin-serveurs/linux/references-complementaires/neovim/#configurer-les-raccourcis
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Remove search highlight" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Remove search highlight" })
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selection downwards" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selection upwards" })
map("n", "J", "mzJ`z", { desc = "Join lines witout moving cursor" })

-- Oil
map("n", "<leader>cd", "<cmd>Oil<CR>", { desc = "Open Oil file explorer" })
map("n", "<leader>Cd", "<cmd>Oil --float<CR>", { desc = "Open Oil file explorer in floating window" })

-- Conform
map("n", "<leader>fm", function()
	conform.format()
end, { desc = "Format code with conform" })

-- Save all, save session and quit
map("n", "<leader>qq", function()
	vim.cmd("silent! wa")
	vim.cmd("mksession!")
	vim.cmd("qa")
end, { desc = "Write all buffers, save session and quit" })

-- Python execute
map("n", "<leader>p", function()
	vim.cmd("write")
	vim.cmd("!python3 %")
end, { desc = "Write buffer and execute as Python code" })

-- faster pane navigation
map("n", "<C-k>", "<cmd>wincmd k<CR>")
map("n", "<C-j>", "<cmd>wincmd j<CR>")
map("n", "<C-l>", "<cmd>wincmd l<CR>")
map("n", "<C-h>", "<cmd>wincmd h<CR>")
map("n", "<C-p>", "<cmd>wincmd p<CR>")

-- quick escape
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

-- luasnip
local ls = require("luasnip")

map({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
map({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
map({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

map({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

-- pytest
map("n", "<leader>tu", "<cmd>PytestUI<CR>", { desc = "Open PytestUI" })

-- lsp
map("n", "<leader>le", function()
	vim.diagnostic.open_float({ focusable = true })
end, { desc = "Expand an Error into a float" })

-- toggle
-- Forward toggle
map("n", "gs", function()
	require("toggle").toggle()
end, { desc = "Toggle word (Forward)" })

-- Backward toggle (pass `true` to reverse direction)
map("n", "gS", function()
	require("toggle").toggle(true)
end, { desc = "Toggle word (Backward)" })
