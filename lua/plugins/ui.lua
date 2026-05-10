return {
  -- Theme
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme "catppuccin-nvim"
    end
  },

  -- Landing Page
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }

      _Gopts = {
        position = "center",
        hl = "Type",
        wrap = "overflow"
      }

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
        dashboard.button("g", "󰱼   Find word", ":Telescope live_grep<CR>"),
        dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("c", "   Config", ":e $MYVIMRC <CR>"),
        dashboard.button("m", "󱌣   Mason", ":Mason<CR>"),
        dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
        dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
        dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
      }

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local count = (math.floor(stats.startuptime * 100) / 100)
          dashboard.section.footer.val = {
            "󱐌 " .. stats.count .. " plugins loaded in " .. count .. " ms",
          }
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  -- Fuzzy finder and other ui windows
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }

      require("telescope").load_extension("ui-select")
    end
  },

  -- Floating notifications, command and search bars
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          long_message_to_split = true, -- long messages will be sent to a split
          lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
      })
    end
  },

  -- Navigation tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup {
        window = {
          width = 28,
        }
      }
    end
  },

  -- Status line at bottom
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          theme = "catppuccin-nvim",
        }
      }
    end
  },

  -- Buffer tabs at top
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim",       -- Required for v0.4.0+
      "nvim-tree/nvim-web-devicons", -- If you want devicons
      "stevearc/resession.nvim"      -- Optional, for persistent history
    },
    config = function()
      local is_picking_focus = require('cokeline.mappings').is_picking_focus
      local is_picking_close = require('cokeline.mappings').is_picking_close
      local get_hex = require('cokeline.hlgroups').get_hl_attr

      local red = vim.g.terminal_color_1
      local yellow = vim.g.terminal_color_3

      require('cokeline').setup({
        default_hl = {
          fg = function(buffer)
            return
                buffer.is_focused
                and get_hex('Normal', 'fg')
                or get_hex('Comment', 'fg')
          end,
          bg = function(buffer)
            return
                buffer.is_focused
                and get_hex('ColorColumn', 'bg')
                or get_hex('CursorLine', 'bg')
          end,
        },

        sidebar = {
          components = {
            {
              text = " NeoTreeMenu",
              fg = function() return get_hex('NeoTreeFileNameOpened', 'fg') end,
              bg = function() return get_hex('NeoTreeNormal', 'bg') end,
              bold = true,
            },
          }
        },

        components = {
          {
            text = function(buffer) return (buffer.index ~= 1) and '▏' or '' end,
          },
          {
            text = ' ',
          },
          {
            text = function(buffer)
              return
                  (is_picking_focus() or is_picking_close())
                  and buffer.pick_letter .. ' '
                  or buffer.devicon.icon
            end,
            fg = function(buffer)
              return
                  (is_picking_focus() and yellow)
                  or (is_picking_close() and red)
                  or buffer.devicon.color
            end,
            italic = function()
              return
                  (is_picking_focus() or is_picking_close())
            end,
            bold = function()
              return
                  (is_picking_focus() or is_picking_close())
            end
          },
          {
            text = ' ',
          },
          {
            text = function(buffer) return buffer.filename .. '  ' end,
            bold = function(buffer)
              return buffer.is_focused
            end,
          },
          {
            text = '✕',
            on_click = function(_, _, _, _, buffer)
              buffer:delete()
            end,
          },
          {
            text = ' ',
          },
        },
      })
    end,
  },

  -- Shortcut helper
  {
    "folke/which-key.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      preset = "modern",
      sort = { "manual" },
    },
  },

  -- Easy Navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
  },
}
