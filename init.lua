-- NeoVim Configuration

-- Detect OS
if vim.fn.exists("g:os") == 0 then
  local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
  if is_windows then
    vim.g.os = "Windows"
  else
    if vim.fn.system("uname -a"):lower():find "microsoft" then
      vim.g.os = "Wsl"
    else
      vim.g.os, _ = string.gsub(vim.fn.system("uname"), "\n", "")
    end
  end
end

-- Set leader key to <space>
vim.g.mapleader = " "

-- Base initial configs
require("configs")

-- Lazy plugin manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Mappings
require("mappings")
