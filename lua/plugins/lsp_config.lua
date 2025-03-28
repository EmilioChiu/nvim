return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"elixirls",
					"emmet_ls",
					"marksman",
					"lua_ls",
					"solargraph",
					"pyright",
					"jdtls",
					"jsonls",
					"cssls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_config = require("lspconfig")

			lsp_config.lua_ls.setup({ capabilities = capabilities })
			lsp_config.solargraph.setup({ capabilities = capabilities })
			lsp_config.pyright.setup({ capabilities = capabilities })
			lsp_config.jdtls.setup({ capabilities = capabilities })
			lsp_config.jsonls.setup({ capabilities = capabilities })
			lsp_config.cssls.setup({ capabilities = capabilities })
			lsp_config.elixirls.setup({
				capabilities = capabilities,
				cmd = { "/Users/emiliochiu/.config/elixir_ls/language_server.sh" },
			})
			lsp_config.marksman.setup({ capabilities = capabilities })
			lsp_config.emmet_ls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			-- this is for diagnositcs signs on the line number column
			local signs = { Error = "💢", Warn = "⚡", Hint = "🤖", Info = "🚀" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			vim.api.nvim_create_user_command("DiagnosticToggle", function()
				local config = vim.diagnostic.config
				local vt = config().virtual_text
				config({
					virtual_text = not vt,
					underline = not vt,
					signs = not vt,
				})
			end, { desc = "toggle diagnostic" })
		end,
	},
}
