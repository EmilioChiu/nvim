return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  -- "catppuccin/nvim",
  -- lazy = false,
  -- name = "catppuccin",
  -- priority = 1000,
  -- opts = {
  -- 	color_overrides = {
  -- 		all = {
  -- 			text = "#ffffff",
  -- 		},
  -- 		mocha = {
  -- 			base = "#1e1e2e",
  -- 		},
  -- 		frappe = {},
  -- 		macchiato = {},
  -- 		latte = {},
  -- 	},
  -- },
  config = function()
    vim.cmd([[colorscheme tokyonight-night]])
		-- vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
