-- Leave insert mode with jj
vim.cmd("inoremap jj <esc>")

-- Quit
vim.cmd("nmap <leader>q :quit<cr>")

-- Save
vim.cmd("nmap <leader>w :update<cr>")

-- Redo with U
vim.cmd("nmap U <C-r>")
