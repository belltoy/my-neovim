-- Neovim plugin for a code outline window

return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },

  config = function()
    require("aerial").setup({
      backends = {
          ['_']  = {"treesitter", "lsp", "markdown", "man"},
          markdown = {"markdown"},
      },

      layout = {
          min_width = 60,
      },

      filter_kind = false,
    })
  end
}
