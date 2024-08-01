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
        ['_']    = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
        rust     = { "lsp", "treesitter" },
        markdown = { "markdown" },
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

      show_guides = true,
      guides = {
        -- When the child item has a sibling below it
        mid_item = " ├─ ",
        -- When the child item is the last in the list
        last_item = " └─ ",
        -- When there are nested child guides to the right
        nested_top = " │ ",
        -- Raw indentation
        whitespace = "  ",
      },
      icons = {
        Array         = "󱡠 ",
        Boolean       = "󰨙 ",
        Class         = "󰆧 ",
        Constant      = "󰏿",
        Constructor   = " ",
        Enum          = " ",
        EnumMember    = " ",
        Event         = "",
        Field         = "",
        File          = "󰈙",
        Function      = "󰊕",
        Interface     = "",
        Key           = "󰌋",
        Method        = "󰊕",
        Module        = "",
        Namespace     = "󰦮",
        Null          = "󰟢",
        Number        = "󰎠",
        Object        = "",
        Operator      = "󰆕",
        Package       = "",
        Property      = "",
        String        = "",
        Struct        = "󰆼",
        TypeParameter = "󰗴",
        Variable      = "󰀫",
        Collapsed     = "",
      },

    })

    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<cr>", { silent = true, desc = "Outline" })
  end
}
