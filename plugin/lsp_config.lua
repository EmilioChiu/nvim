require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { 
	"sumneko_lua", "bashls", "elixirls", "html",
	"jsonls", "powershell_es", "pyright", "sqlls" 
    },
    automatic_installation = true
})
