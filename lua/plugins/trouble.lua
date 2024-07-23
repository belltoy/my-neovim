return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    modes = {
      diagnostics = {
        mode = "diagnostics",
        win = {
          position = "right",
          size = 80,
          fixed = false,
          padding = { top = 0, left = 0 },
        },
      },

      s = {
        mode = "symbols",
        win = {
          position = "right",
          size = 50,
          fixed = false,
          padding = { top = 0, left = 0 },
        },
      },

      todo = {
        mode = "todo",
        win = {
          position = "right",
          size = 80,
          fixed = false,
          padding = { top = 0, left = 0 },
        },
      },

      lsp_incoming_calls = {
        mode = "lsp_incoming_calls",
        keys = {
          ["<cr>"] = "jump_close",
        },
        win = {
          title = "Incoming Calls",
          type = "float",
          relative = "cursor",
          border = "rounded",
          position = { 0.03, 0.03 },
          size = { width = 50, height = 10 },
          fixed = false,
        },
      },

      lsp_outgoing_calls = {
        mode = "lsp_outgoing_calls",
        keys = {
          ["<cr>"] = "jump_close",
        },
        win = {
          title = "Outgoing Calls",
          type = "float",
          relative = "cursor",
          border = "rounded",
          position = { 0.03, 0.03 },
          size = { width = 60, height = 10 },
          fixed = false,
        },
      },
    },
  },

  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      desc = "Diagnostics",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
      desc = "Diagnostics (Buffer)",
    },
    {
      "<leader>xo",
      "<cmd>Trouble s toggle focus=true<cr>",
      desc = "Outline (Trouble)",
    },
    {
      "<leader>xt",
      "<cmd>Trouble todo toggle focus=true<cr>",
      desc = "Todo",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=true win.position=right win.size=60<cr>",
      desc = "LSP Definitions / references / ...",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle focus=true win.position=right win.size=60<cr>",
      desc = "Location List",
    },
    {
      "<leader>xq",
      "<cmd>Trouble qflist toggle focus=true win.position=right win.size=60<cr>",
      desc = "Quickfix List",
    },

    {
      "<leader>xc",
      "<cmd>Trouble lsp_incoming_calls toggle focus=true win.type=float<cr>",
      desc = "Incoming Calls",
    },

    {
      "<leader>xC",
      "<cmd>Trouble lsp_outgoing_calls toggle focus=true win.type=float<cr>",
      desc = "Outgoing Calls",
    },
  },
}
