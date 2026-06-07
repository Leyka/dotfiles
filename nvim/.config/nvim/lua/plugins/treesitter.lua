return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "javascript", "typescript", "tsx",
        "python", "go",
        "json", "yaml", "toml",
        "html", "css",
        "bash", "markdown", "markdown_inline",
      },
    })
  end,
}
