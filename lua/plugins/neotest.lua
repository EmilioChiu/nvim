return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
    "jfpedroza/neotest-elixir",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec"),
        require("neotest-elixir"),
      },
    })
  end
}

-- local dap = require "dap"
-- -- debbuger
-- vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
--
