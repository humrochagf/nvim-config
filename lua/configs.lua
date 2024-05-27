-- Base tab configs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Line Wrap
vim.cmd("set nowrap")

-- Show special characters
vim.cmd [[
  set invlist
]]
vim.opt.listchars = "tab:|-,trail:.,extends:>,precedes:<"

-- Enable system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Spelling
vim.opt.spelllang = { "en", "pt_br", "fr" }

-- Disable swapfile
vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
