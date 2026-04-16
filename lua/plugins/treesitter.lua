return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  main = "nvim-treesitter",
  init = function()
    vim.api.nvim_create_autocmd(
      'FileType',
      {
        callback = function()
          -- Enable treesitter highlighting and disable regex syntax
          pcall(vim.treesitter.start)
          -- Enable treesitter-based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      }
    )

    local ensureInstalled = {
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
      "markdown_inline",
      "python",
      "regex",
      "rust",
      "terraform",
      "toml",
      "typescript",
      "vim",
      "yaml",
      "zig",
    }

    local alreadyInstalled = require('nvim-treesitter.config').get_installed()

    local parsersToInstall = vim.iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require('nvim-treesitter').install(parsersToInstall)
  end,
}
