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

      disable_max_lines = 25000,

      layout = {
        min_width = 60,
      },

      highlight_on_hover = true,
      manage_folds = true,
      link_tree_to_folds = false,
      filter_kind = false,
      autojump = true,

    })

    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<cr>", { silent = true, desc = "Outline" })
  end
}
