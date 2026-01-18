local lsp_list = {
  -- Python
  'jinja_lsp',
  'ruff',
  'ty',

  -- Javascript / Typescript
  'eslint',
  'ts_ls',

  -- JSON
  'jsonls',

  -- Lua
  'lua_ls',

  -- Zig
  'zls',

  -- Rust
  'rust_analyzer',

  -- Go
  'gopls',

  -- SASS
  'somesass_ls',

  -- HTML
  'emmet_language_server',

  -- Bash
  'bashls',

  -- TOML
  'taplo',

  -- YAML
  'yamlls',

  -- Markdown
  'marksman',

  -- Docker
  'dockerls',
  'docker_compose_language_service',

  -- Terraform
  'terraformls',

  -- Helm
  'helm_ls',
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
      automatic_enable = false,
      ensure_installed = lsp_list,
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

      -- Enable lsp

      vim.lsp.enable(lsp_list)
    end
  }
}
