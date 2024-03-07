vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp = require'cmp'
local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
	-- REQUIRED - you must specify a snippet engine
	expand = function(args)
	    vim.fn["vsnip#anonymous"](args.body)
	end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
	['<Up>'] = cmp.mapping.select_prev_item(select_opts),
	['<Down>'] = cmp.mapping.select_next_item(select_opts),

	['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
	['<C-n>'] = cmp.mapping.select_next_item(select_opts),

	['<C-u>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),

	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({select = true}),
    }),

    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'vsnip' },
    }, {
	{ name = 'buffer' },
    })
})
