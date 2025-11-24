return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
      -- "3rd/image.nvim", -- Optional image support to nvim
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
      vim.keymap.set('n', '<leader>w', ':Neotree toggle float<CR>')
      vim.keymap.set('n', '<leader>e', ':Neotree toggle position=left<CR>')
      vim.keymap.set('n', '<leader>ngs', ':Neotree float git_status<CR>')
    end
  }
}
