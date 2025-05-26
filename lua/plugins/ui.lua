return {
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
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          theme = "catppuccin",
        }
      }
    end
  },
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
              fg = function () return get_hex('NeoTreeFileNameOpened', 'fg') end,
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
}
