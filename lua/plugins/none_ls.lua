return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.formatting.autoflake,
			},
		})

		vim.keymap.set("n", "<leader>nf", vim.lsp.buf.format, {})
	end,
}
