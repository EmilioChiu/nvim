return {
  "iamcco/markdown-preview.nvim",

  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
    "MarkdownPreviewToggle",
  },

  build = "cd app && npm install",
  ft = { "markdown" },

  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_browser = "Arc"
  end,

  keys = {
    {
      "<leader>mdt",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview Toggle",
      ft = "markdown",
    }
  }
}
