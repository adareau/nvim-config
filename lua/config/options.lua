-- vim options
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true  -- indent with spaces (use a .editorconfig / ftplugin for tab-indented projects)
vim.opt.showmode = false  -- hides mode (shown in lualine)
vim.opt.scrolloff = 8     -- bottom/top lines
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.ignorecase = true -- case-insensitive search...
vim.opt.smartcase = true  -- ...unless the pattern contains an uppercase letter
vim.opt.undofile = true   -- persistent undo across sessions
vim.opt.signcolumn = "yes" -- always show the sign column (no text shift from gitsigns/diagnostics)
vim.opt.splitright = true -- :vsplit opens on the right
vim.opt.splitbelow = true -- :split opens below

-- doge
vim.g.doge_doc_standard_python = "numpy"

-- exrc
vim.o.exrc = true
