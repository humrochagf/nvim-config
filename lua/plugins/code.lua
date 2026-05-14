local lsp_list = {
  -- Python
  'jinja_lsp',
  'ruff',
  'zuban',

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
  -- Language server installer
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end
  },

  -- Language server configuration
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    opts = {
      auto_install = true,
      ensure_installed = lsp_list,
    }
  },

  -- Code highlight
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter",
    init = function()
      vim.api.nvim_create_autocmd(
        "FileType",
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

      local alreadyInstalled = require("nvim-treesitter.config").get_installed()

      local parsersToInstall = vim.iter(ensureInstalled)
          :filter(function(parser)
            return not vim.tbl_contains(alreadyInstalled, parser)
          end)
          :totable()
      require("nvim-treesitter").install(parsersToInstall)
    end,
  },

  -- Code snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp, luasnip = require("cmp"), require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = true,
                })
              end
            else
              fallback()
            end
          end),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "render-markdown" }
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
  },

  -- Python specific
  {
    "Vimjas/vim-python-pep8-indent",
  },
}
