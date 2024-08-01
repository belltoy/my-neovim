return {
  "elixir-tools/elixir-tools.nvim",
  enabled = false,
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")
    local on_attach = require("config.mason_settings").on_attach

    elixir.setup {
      nextls = {enable = false},

      elixirls = {
        enable = true,
        tag = "v0.22.1",
        settings = elixirls.settings {
          dialyzerEnabled = true,
          enableTestLenses = false,
        },
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          on_attach(client, bufnr)
        end,
      },
      projectionist = {
        enable = true
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
