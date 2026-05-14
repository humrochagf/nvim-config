-- Default options
vim.opt.whichwrap:append "<,>,[,],h,l"                    -- move to other line with left right navigation at the line edges
vim.opt.expandtab = true                                  -- tabs are spaces, not tabs
vim.opt.tabstop = 4                                       -- an indentation every 4 spaces
vim.opt.softtabstop = 4                                   -- let backspace delete 4 spaces of indent
vim.opt.shiftwidth = 4                                    -- use indents of 4 spaces
vim.opt.listchars = "tab:|-,trail:.,extends:>,precedes:<" -- map special characters
vim.opt.backup = false                                    -- creates a backup file
vim.opt.swapfile = false                                  -- disable swapfile
vim.opt.undofile = true                                   -- persistent undo across sessions
vim.opt.clipboard = "unnamedplus"                         -- allows neovim to access the system clipboard
vim.opt.wrap = false                                      -- display line without breaking into multiple
vim.opt.spelllang = { "en", "pt_br", "fr" }               -- configured spell check languages
vim.opt.number = true                                     -- numbered lines
vim.opt.ignorecase = true                                 -- ignore case in search patterns
vim.opt.smartcase = true                                  -- case sensitive when Upper Case is present
vim.opt.autoindent = true                                 -- indent at the same level of the previous line
vim.opt.scrolloff = 8                                     -- keep 8 lines around the cursor
vim.opt.updatetime = 50                                   -- snappy CursorHold
vim.opt.winborder = "rounded"                             -- global border setting
vim.opt.fcs = 'eob: '                                     -- remove the ~ chars after the end of buffer

-- Languages that defaults to 2 spaces indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "json",
    "lua",
    "markdown",
    "toml",
    "typescript",
    "yaml",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Show invisible characters
vim.cmd [[
  set invlist
]]
