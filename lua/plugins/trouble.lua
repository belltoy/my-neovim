return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    require('trouble').setup({
      position = "right", -- position of the list can be: bottom, top, left, right
      auto_fold = true, -- automatically fold a file trouble list at creation
      action_keys = {
        jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
        jump_close = {}, -- jump to the diagnostic and close the list
        toggle_fold = {"o", "zA", "za"}, -- toggle fold of current file
      },
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end,

  keys = {
    -- this is a table of key mappings
    -- you can call "map" here, it will be called after the plugin is loaded
    -- please refer to the mappings section below
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Open/close trouble list"},
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc ="Open trouble list for workspace diagnostics"},
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Open trouble list for document diagnostics"},
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Open trouble list for quickfix"},
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Open trouble list for loclist"},
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Open todos in trouble"},
  },
}
