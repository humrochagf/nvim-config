return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")

    config.setup({
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "helm",
        "http",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "rust",
        "terraform",
        "toml",
        "typescript",
        "yaml",
        "zig",
      },
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { "yaml", "python" },
      },
    })
  end
}
