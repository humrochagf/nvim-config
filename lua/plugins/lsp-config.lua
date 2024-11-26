return {
  {
    "williamboman/mason.nvim",
    lazy = false,
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
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        -- Python
        "jinja_lsp",
        "pyright",
        "ruff",
        -- Javascript / Typescript
        "eslint",
        "ts_ls",
        -- Json
        "jsonls",
        -- Lua
        "lua_ls",
        -- Zig
        "zls",
        -- Rust
        "rust_analyzer",
        -- Go
        "gopls",
        -- Sass
        "somesass_ls",
        -- Bash
        "bashls",
        -- Toml
        "taplo",
        -- Yaml
        "yamlls",
        -- Markdown
        "marksman",
        -- Docker
        "dockerls",
        "docker_compose_language_service",
        -- Terraform
        "terraformls",
        -- Helm
        "helm_ls",
      },
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      -- Python

      lspconfig.jinja_lsp.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      })

      lspconfig.ruff.setup({
        capabilities = capabilities,
      })

      -- Javascript / Typescript

      lspconfig.eslint.setup({
        capabilities = capabilities,
      })

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- Json

      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      -- Lua

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- Zig

      lspconfig.zls.setup({
        capabilities = capabilities,
      })

      -- Rust

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })

      -- Go

      lspconfig.gopls.setup({
        capabilities = capabilities,
      })

      -- Sass

      lspconfig.somesass_ls.setup({
        capabilities = capabilities,
      })

      -- Bash

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      -- Toml

      lspconfig.taplo.setup({
        capabilities = capabilities,
      })

      -- Yaml

      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })

      -- Markdown

      lspconfig.marksman.setup({
        capabilities = capabilities,
      })

      -- Docker

      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })

      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities,
      })

      -- Terraform

      lspconfig.terraformls.setup({
        capabilities = capabilities,
      })

      -- Helm

      lspconfig.helm_ls.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    end
  }
}
