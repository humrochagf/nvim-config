local default_options = {
  -- tab configs
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,

  listchars = "tab:|-,trail:.,extends:>,precedes:<", -- Map special characters
  backup = false, -- creates a backup file
  swapfile = false, -- disable swapfile
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  wrap = false, -- display line without breaking into multiple
  spelllang = { "en", "pt_br", "fr" },
  number = true, -- numbered lines
  ignorecase = true, -- ignore case in search patterns
  smartcase = true,
}

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
