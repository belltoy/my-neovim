local float_win = function(title)
  return {
    title = title,
    type = "float",
    relative = "cursor",
    border = "rounded",
    anchor = "NW",
    position = { 2, 2 },
    size = { width = 60, height = 10 },
    zindex = 201,
    fixed = false,
  }
end

local float_preview = {
  type = "float",
  size = {
    width = 80,
    height = 30,
  },
  border = "rounded",
  relative = "win",
  anchor = "NW",
  position = { 0, 61 },
  zindex = 200,
  -- when a buffer is not yet loaded, the preview window will be created
  -- in a scratch buffer with only syntax highlighting enabled.
  -- Set to false, if you want the preview to always be a real loaded buffer.
  scratch = true,

}

local right_split_win = {
  type = "split",
  position = "right",
  size = 80,
  fixed = false,
  padding = { top = 0, left = 0 }
}

local right_split_preview = {
  type = "float",
  size = {
    width = 100,
    height = 60,
  },
  -- relative = "editor",
  relative = "win",
  anchor = "NE",
  position = { 0, -60 },
  zindex = 200,
  -- when a buffer is not yet loaded, the preview window will be created
  -- in a scratch buffer with only syntax highlighting enabled.
  -- Set to false, if you want the preview to always be a real loaded buffer.
  scratch = true,
}

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    auto_preview = false,
    preview = right_split_preview,
    modes = {
      diagnostics = {
        mode = "diagnostics",
        win = right_split_win,
      },

      symbols = {
        mode = "symbols",
        win = right_split_win,
      },

      todo = {
        mode = "todo",
        win = right_split_win,
      },

      lsp_incoming_calls = {
        mode = "lsp_incoming_calls",
        keys = {
          ["<cr>"] = "jump_close",
          ["<esc>"] = "close",
        },
        win = float_win("Incoming Calls"),
        preview = float_preview,
      },

      lsp_outgoing_calls = {
        mode = "lsp_outgoing_calls",
        keys = {
          ["<cr>"] = "jump_close",
          ["<esc>"] = "close",
        },
        win = float_win("Outgoing Calls"),
        preview = float_preview,
      },

      lsp_references = {
        mode = "lsp_references",
        keys = {
          ["<cr>"] = "jump_close",
          ["<esc>"] = "close",
        },
        win = float_win("References"),
        preview = float_preview,
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
      "<cmd>Trouble symbols toggle focus=true<cr>",
      desc = "Outline (Trouble)",
    },
    {
      "<leader>xt",
      "<cmd>Trouble todo toggle focus=true<cr>",
      desc = "Todo",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=true win.position=right win.size=60 follow=false<cr>",
      desc = "LSP Definitions / references / ...",
    },
    {
      "<leader>xr",
      "<cmd>Trouble lsp_references toggle focus=true<cr>",
      desc = "LSP references",
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
