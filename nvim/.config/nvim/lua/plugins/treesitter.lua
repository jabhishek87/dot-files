return {
--  'akinsho/bufferline.nvim', version = 'v1.*', dependencies = 'nvim-tree/nvim-web-devicons',
  "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
  config = function()
    -- vim.opt.termguicolors = true
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "go", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", },
    })

  end
  
}

