return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			automatic_enable = true, -- ⚠️ Requiere Neovim 0.11+
			ensure_installed = {
				"lua_ls",
				"pyright",
				"solargraph",
				"jdtls",
				"jsonls",
				"cssls",
				"elixirls",
				"marksman",
				"emmet_ls",
			},
			handlers = {
				function(server_name)
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					require("lspconfig")[server_name].setup({ capabilities = capabilities })
				end,
				elixirls = function()
					require("lspconfig").elixirls.setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
						cmd = { "/Users/emiliochiu/.config/elixir_ls/language_server.sh" },
					})
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Atajos de LSP
			vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			-- Diagnóstico: signos personalizados
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
