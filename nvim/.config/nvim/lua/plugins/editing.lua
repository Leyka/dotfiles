return {
  -- Comment avec gcc / gc
  { "numToStr/Comment.nvim", opts = {} },

  -- Auto close brackets/quotes
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- Surround avec cs/ds/ys
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy", opts = {} },

  -- Markdown rendered inline
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {},
  },

  -- Autocomplete simple depuis le buffer (sans LSP)
  {
    "echasnovski/mini.completion",
    version = "*",
    opts = {},
  },
}
