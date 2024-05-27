return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")

    config.setup({
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "go",
        "http",
        "javascript",
        "json",
        "lua",
        "python",
        "toml",
        "typescript",
        "css",
        "rust",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
