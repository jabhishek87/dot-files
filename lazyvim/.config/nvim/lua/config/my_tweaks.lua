-- File: ~/dotfiles/lazyvim/.config/nvim/lua/config/my_tweaks.lua

-- Save all undo histories centrally instead of cluttering project folders
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo//"
vim.opt.undofile = true

-- Display a simple confirmation message on launch
vim.notify("my_tweaks configuration loaded successfully!", vim.log.levels.INFO, { title = "System" })

