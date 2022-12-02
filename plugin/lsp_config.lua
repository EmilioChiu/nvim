require("mason").setup()
require("mason-lspconfig").setup()
local set_keymap = vim.api.nvim_buf_set_keymap

-- Servers
local servers = {'pyright', 'emmet_ls', 'tsserver', 'jdtls', 'html', 'jsonls', 'cssls'}

-- Keybinddings
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }

    set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    set_keymap(bufnr, 'n', '<leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

-- Starting-Normal-Servers
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = {
	    debounce_text_changes = 150,
	}
    }
end

-- Special configuration for elixir 
require('lspconfig').elixirls.setup {
    cmd = { "C:/Users/Emilio Chiu/AppData/Local/nvim-data/mason/packages/elixir-ls/rel/language_server.bat" },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
	debounce_text_changes = 150
    }
}

-- Special configuration for sumneko_lua 
require'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
	debounce_text_changes = 150
    },
    settings = {
	Lua = {
	    diagnostics = {
		globals = {'vim'},
	    },
	},
    },
}

-- Special configuration for html 
require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
	debounce_text_changes = 150
    },
}
-- this is for diagnositcs signs on the line number column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
