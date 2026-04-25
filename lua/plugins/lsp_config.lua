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
					"pyright",
					"jdtls",
					"jsonls",
					"cssls",
					"html",
					"ts_ls",
					"eslint",
					"yamlls",
					"texlab",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local schemastore = require("schemastore")

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,

				settings = {
					Lua = {

						runtime = {
							version = "LuaJIT",
						},

						diagnostics = {
							globals = { "vim" },
						},

						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},

						telemetry = {
							enable = false,
						},
					},
				},
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,

				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})

			vim.lsp.config("jsonls", {
				capabilities = capabilities,

				settings = {
					json = {
						validate = { enable = true },

						schemas = schemastore.json.schemas(),

						format = {
							enable = true,
						},
					},
				},
			})

			vim.lsp.config("cssls", {
				capabilities = capabilities,

				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
						completion = {
							completePropertyWithSemicolon = true,
							triggerPropertyValueCompletion = true,
						},
						format = {
							enable = true,
						},
					},

					scss = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},

					less = {
						validate = true,
					},
				},
			})

			local elixirls_cmd = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language_server.sh"
			local texlab_cmd = vim.fn.stdpath("data") .. "/mason/packages/texlab/texlab"

			vim.lsp.config("elixirls", {
				cmd = { elixirls_cmd },

				capabilities = capabilities,

				settings = {
					elixirLS = {
						dialyzerEnabled = true,
						dialyzerFormat = "short",
						fetchDeps = true,
						enableTestLenses = true,
						formatter = { enabled = true },
						suggestSpecs = true,
						signatureAfterComplete = true,
					},
				},
			})

			vim.lsp.config("marksman", {
				capabilities = capabilities,

				settings = {
					markdown = {
						completion = {
							wikiLinks = true,
						},

						links = {
							validate = true,
						},

						diagnostics = {
							enable = true,
						},
					},
				},
			})

			vim.lsp.config("emmet_ls", {
				capabilities = capabilities,

				settings = {
					emmet = {
						showExpandedAbbreviation = "always",
						showAbbreviationSuggestions = true,

						includeLanguages = {
							javascript = "javascriptreact",
							typescript = "typescriptreact",
						},

						excludeLanguages = { "markdown" },

						variables = {
							lang = "en",
						},

						preferences = {
							["bem.enabled"] = true,
						},
					},
				},
			})

			vim.lsp.config("docker_language_server", {
				capabilities = capabilities,
				settings = {
					docker = {
						validate = true,
						hover = true,
						completion = true,
					},
				},
			})

			vim.lsp.config("texlab", {
				cmd = { texlab_cmd },
				filetypes = { "tex", "latex", "bib" },
				capabilities = capabilities,
				settings = {
					texlab = {
						auxDirectory = ".",
						bibtexFormatter = "texlab",
						build = {
							args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
							executable = "latexmk",
							forwardSearchAfter = false,
							onSave = false,
						},
						chktex = {
							onEdit = false,
							onOpenAndSave = false,
						},
						diagnosticsDelay = 300,
						formatterLineLength = 80,
						forwardSearch = {
							args = {},
							executable = nil,
						},
						latexFormatter = "latexindent",
						latexindent = {
							["local"] = nil,
							modifyLineBreaks = false,
						},
					},
				},
			})

			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"jdtls",
				"elixirls",
				"html",
				"cssls",
				"emmet_ls",
				"ts_ls",
				"eslint",
				"jsonls",
				"yamlls",
				"marksman",
				"docker_language_server",
				"texlab",
			})

			vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})

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
