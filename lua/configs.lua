-- Default options
vim.opt.whichwrap:append "<,>,[,],h,l"                    -- move to other line with left right navigation at the line edges
vim.opt.expandtab = true                                  -- tabs are spaces, not tabs
vim.opt.tabstop = 2                                       -- an indentation every 2 spaces
vim.opt.softtabstop = 2                                   -- let backspace delete indent
vim.opt.shiftwidth = 2                                    -- use indents of 2 spaces
vim.opt.listchars = "tab:|-,trail:.,extends:>,precedes:<" -- map special characters
vim.opt.backup = false                                    -- creates a backup file
vim.opt.swapfile = false                                  -- disable swapfile
vim.opt.clipboard = "unnamedplus"                         -- allows neovim to access the system clipboard
vim.opt.wrap = false                                      -- display line without breaking into multiple
vim.opt.spelllang = { "en", "pt_br", "fr" }               -- configured spell check languages
vim.opt.number = true                                     -- numbered lines
vim.opt.ignorecase = true                                 -- ignore case in search patterns
vim.opt.smartcase = true                                  -- case sensitive when Upper Case is present
vim.opt.autoindent = true                                 -- indent at the same level of the previous line
vim.opt.scrolloff = 8                                     -- keep 8 lines around the cursor
vim.opt.updatetime = 50                                   -- snappy CursorHold

-- Show invisible characters
vim.cmd [[
  set invlist
]]
