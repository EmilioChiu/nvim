require("mason").setup()
require("mason-lspconfig").setup()
local set_keymap = vim.api.nvim_buf_set_keymap

-- Servers
local servers = {
    'pyright', 'tsserver', 'jdtls', 'sumneko_lua', 'html',
    'jsonls', 'cssls'
}

-- Auto-compleate
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

-- Starting-Servers
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

-- Auto-complete
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require'cmp'

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    snippet = {
	-- REQUIRED - you must specify a snippet engine
	expand = function(args)
	    vim.fn["vsnip#anonymous"](args.body)
	end,
    },
    window = {
	-- completion = cmp.config.window.bordered(),
	-- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

	["<Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_next_item()
	    elseif vim.fn["vsnip#available"](1) == 1 then
		feedkey("<Plug>(vsnip-expand-or-jump)", "")
	    elseif has_words_before() then
		cmp.complete()
	    else
		fallback()
	    end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function()
	    if cmp.visible() then
		cmp.select_prev_item()
	    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		feedkey("<Plug>(vsnip-jump-prev)", "")
	    end
	end, { "i", "s" })
    }),
    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'vsnip' },
    }, {
	{ name = 'buffer' },
    })
})

-- this is for diagnositcs signs on the line number column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
