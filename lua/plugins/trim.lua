return {
  'cappyzawa/trim.nvim',
  config = function()
    require('trim').setup {
      trim_on_write = false,
      trim_first_line = false,
      highlight = true,
      ft_blocklist = {
        "neo-tree",
        "help",
        "TelescopePrompt",
        "toggleterm",
        "lspinfo",
        "aerial",
        "alpha",
        "startify",
        "prompt",
        "checkhealth",
        "mason",
        "lazy",
      },
    }
  end
}
