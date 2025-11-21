return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "lua",
	        "vim",
	        "python",
        },
        highlight = { enable = true },
        indent = { enable = false },
      })
    end
  }
}
