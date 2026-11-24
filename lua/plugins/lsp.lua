return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Defaults shared by every server (cmd/filetypes/root_markers come from nvim-lspconfig)
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- Lua LSP: extra settings on top of the nvim-lspconfig defaults
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } }, -- recognize the `vim` global
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false, -- disable annoying warnings for third-party libraries
						},
						telemetry = { enable = false },
					},
				},
			})

			-- Mason setup (mason-lspconfig v2 calls vim.lsp.enable() for installed servers)
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- lua LSP
					"html", -- html LSP
					"cssls", -- css LSP
					"emmet_ls", -- emmet LSP
					"jsonls", -- json LSP
					"pyright", -- python LSP
					"marksman", -- markdown LSP
				},
			})

			-- Buffer-local keymaps for every server that attaches.
			-- Built-in defaults (Neovim 0.11+) are kept: K = hover, grr = references,
			-- gri = implementation, grn = rename, gra = code action, grt = type definition.
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("user_lsp_keymaps", { clear = true }),
				callback = function(ev)
					local function map(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
					end

					map("gd", vim.lsp.buf.definition, "Go to definition")
					map("gi", vim.lsp.buf.implementation, "Go to implementation")
					map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, "Previous diagnostic")
					map("]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, "Next diagnostic")
				end,
			})

			-- diagnostics config with modern sign configuration
			vim.diagnostic.config({
				virtual_text = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✗",
						[vim.diagnostic.severity.WARN] = "⚠",
						[vim.diagnostic.severity.HINT] = "💡",
						[vim.diagnostic.severity.INFO] = "ℹ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
}
