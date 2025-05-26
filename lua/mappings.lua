-- Leave insert mode with jj
vim.cmd("inoremap jj <esc>")

-- Redo with U
vim.cmd("nmap U <C-r>")

-- Which-key Mappings
local wk = require("which-key")

wk.add({
  { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },

  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
  { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },

  { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Comments" },
  { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comments", mode = "v" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "Clear Search highlight" },

  { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Neotree Toggle" },
  { "<leader>b", "<cmd>Neotree buffers reveal float<CR>", desc = "Neotree Buffers" },

  { "<leader>nd", "<cmd>NoiceDismiss<CR>", desc = "Dismiss Noice Messages" },

  { "<leader>c", group = "Code" },
  { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Code Definition" },
  { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Code Format" },
  { "<leader>ci", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  { "<leader>cj", "<cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>", desc = "Next Diagnostics" },
  { "<leader>cr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Code References" },

  { "<leader>d", group = "Debug" },
  { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
  { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },
  { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
  { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
  { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
  { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
  { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
  { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
  { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
  { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
  { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
  { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },

  { "<leader>f", group = "File" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "File Live Grep" },

  { "<leader>t", group = "Text" },
  { "<leader>ts", "<cmd>setlocal spell!<cr>", desc = "Toggle Spell Check" },
  { "<leader>tw", "<cmd>setlocal wrap!<cr>", desc = "Toggle Line Wrap" },
})
