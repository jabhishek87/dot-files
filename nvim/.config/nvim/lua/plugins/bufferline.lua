return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
     vim.opt.termguicolors = true
    require("bufferline").setup({})
  end
  
}
