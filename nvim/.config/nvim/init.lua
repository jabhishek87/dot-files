--
-- reference https://github.com/hendrikmi/neovim-kickstart-config
-- https://www.youtube.com/watch?v=KYDG3AHgYEs
--

require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps

-- Import color theme based on environment variable NVIM_THEME
local default_color_scheme = 'onedark'  --other values = nord, onedark
local env_var_nvim_theme = os.getenv 'NVIM_THEME' or default_color_scheme

-- Define a table of theme modules
local themes = {
  nord = 'themes.nord',
  onedark = 'themes.onedark',
}



-- Set up the Lazy plugin manager
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup ({  
  require 'plugins.which-key',
  require 'plugins.alpha',
  require 'plugins.neotree',
  require(themes[env_var_nvim_theme]),
  -- require 'plugins.colortheme',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  -- require 'plugins.lsp',
  require 'plugins.autocompletion',
--  require 'plugins.none-ls',
--  require 'plugins.gitsigns',
--  require 'plugins.indent-blankline',
  require 'plugins.misc',
--  require 'plugins.comment',
})
