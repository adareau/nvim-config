-- nvim-treesitter `main` branch (the `master` branch is frozen and unsupported on Neovim 0.12).
-- It only installs parsers/queries: highlighting and indentation are enabled per buffer below.
-- Requires a 64-bit `tree-sitter` CLI (>= 0.26) to build parsers.
local parsers = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"python",
	"xml", -- needed by pytest.nvim
	"html",
	"javascript",
	"typescript",
	"tsx",
	"ruby",
	"markdown",
	"markdown_inline",
	"typst",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- this plugin does not support lazy-loading
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
			callback = function(ev)
				-- start highlighting if a parser exists for this filetype
				if not pcall(vim.treesitter.start, ev.buf) then
					return
				end
				-- treesitter-based indentation (only where an indents query exists)
				local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
				if lang and vim.treesitter.query.get(lang, "indents") then
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
