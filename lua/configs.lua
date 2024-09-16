-- Detect OS
if vim.fn.exists('g:os') == 0 then
    local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
    if is_windows then
        vim.g.os = "Windows"
    else
        local uname_output = vim.fn.system('uname')
        vim.g.os = string.gsub(uname_output, '\n', '')
    end
end

-- Set defaults
local default_options = {
  expandtab = true, -- tabs are spaces, not tabs
  tabstop = 2, -- an indentation every 2 spaces
  softtabstop = 2, -- let backspace delete indent
  shiftwidth = 2, -- use indents of 2 spaces
  listchars = "tab:|-,trail:.,extends:>,precedes:<", -- Map special characters
  backup = false, -- creates a backup file
  swapfile = false, -- disable swapfile
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  wrap = false, -- display line without breaking into multiple
  spelllang = { "en", "pt_br", "fr" },
  number = true, -- numbered lines
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- case sensitive when Upper Case is present
  autoindent = true, -- indent at the same level of the previous line
}

-- Move to other line with left right navigation at the line edges
vim.opt.whichwrap:append "<,>,[,],h,l"

-- Apply default_options
for k, v in pairs(default_options) do
  vim.opt[k] = v
end

-- Show invisible characters
vim.cmd [[
  set invlist
]]

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
