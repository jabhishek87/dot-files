return {
 {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "rust_analyzer" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"vimls", "lua_ls", "pyLsp"},
        automatic_enable = {"vimls", "lua_ls"},
      })
    end
  }, 
}
