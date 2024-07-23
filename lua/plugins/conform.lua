local format = function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end

local f = '<cmd>lua require("conform").format { async = true, lsp_format = "fallback" } <cr><esc>'

return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  keys = {
    { "F",         f,      mode = "v", desc = "Range Format" },
    { "<leader>F", format, mode = "",  desc = "Format buffer" },
  },

  opts = {
    format_on_save = nil,
    formatters_by_ft = {
      erlang = { "erlfmt" },
      rust = { "rustfmt", "injected" },
      sql = { "sleek" },
      go = { "gofmt", --[[ "gofumpt", ]] "injected" },
      yaml = { "yamlfmt", "yq", "injected" },
      toml = { "taplo", "injected" },
      xml = { "xmllint" },
      json = { "jq", "yq" },
      gleam = { "gleam", "injected" },

      -- NOTE: Elixir needs 1.14 or higher
      elixir = { "mix" },
      eelixir = { "mix" },
    },

    formatters = {
      sleek = {
        command = "sleek",
        args = { "--uppercase" },
      },
      xmllint = {
        command = "xmllint",
        args = { "--format", "-" },
      },
    },
  },

  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    vim.cmd([[ command! Format execute 'lua require("conform").format { async = true, lsp_format = "fallback" }' ]])
  end,
}
