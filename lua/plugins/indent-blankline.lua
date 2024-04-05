function setup()
  local indent_blankline = require("ibl")

  indent_blankline.setup({
    enabled = false,
    exclude = {
      buftypes = { "terminal", "nofile" },
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
      },
    },
  })

  -- local treesitter_config_ok, _ = pcall(require, "nvim-treesitter.configs")
  -- if treesitter_config_ok then
  --     vim.g.indent_blankline_use_treesitter = true
  -- end
end

return {
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  config = setup,
}
