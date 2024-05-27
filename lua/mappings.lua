-- Leave insert mode with jj
vim.cmd("inoremap jj <esc>")

-- Redo with U
vim.cmd("nmap U <C-r>")

-- Which-key Mappings
local wk = require("which-key")

-- Visual
wk.register({
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
}, { mode = "v", prefix = "<leader>" })

-- Normal
wk.register({
  [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
  ["e"] = { "<cmd>Neotree toggle<CR>", "Neotree Toggle" },
  ["b"] = { "<cmd>Neotree buffers reveal float<CR>", "Neotree Buffers" },
  ["h"] = { "<cmd>nohlsearch<CR>", "Clear Search highlight" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>confirm q<CR>", "Quit" },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  c = {
    name = "Code",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Code Definition" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Code Format" },
    i = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostics" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Code References" },
  },
  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  },
  f = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find Files" },
    g = { "<cmd>Telescope live_grep<cr>", "File Live Grep" },
  },
  t = {
    name = "Text",
    s = { "<cmd>setlocal spell!<cr>", "Toggle Spell Check" },
    w = { "<cmd>setlocal wrap!<cr>", "Toggle Line Wrap" },
  },
}, { prefix = "<leader>" })
