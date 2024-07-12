return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    modes = {
      all = {
        mode = "symbols",
        win = {
          position = "right",
          size = 50,
          fixed = false,
          padding = { top = 0, left = 0 },
        },
      },

      diagnostics_right = {
        mode = "diagnostics",
        win = {
          position = "right",
          size = 50,
          fixed = false,
          padding = { top = 0, left = 0 },
        },
      },

      todo_right = {
        mode = "todo",
        win = {
          position = "right",
          size = 50,
          fixed = false,
          padding = { top = 0, left = 0 },
        }
      },
    },
  },

  keys = {
    -- {
    --   "<leader>x",
    --   desc = "Trouble",
    -- },
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true win.size=30<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xa",
      "<cmd>Trouble all toggle focus=true<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>xo",
      "<cmd>Trouble all toggle focus=true<cr>",
      desc = "Symbols/Outline (Trouble)",
    },
    {
      "<leader>xs",
      "<cmd>Trouble diagnostics_right toggle focus=true<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xt",
      "<cmd>Trouble todo_right toggle focus=true<cr>",
      desc = "Todo (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=true win.position=right win.size=50<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
