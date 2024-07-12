-- Colorschemes

return {
  -- 'lunarvim/darkplus.nvim',
  'EdenEast/nightfox.nvim',

  'folke/tokyonight.nvim',

  {
    'belltoy/molokai',
    config = function()
      vim.cmd.colorscheme('molokai')
      vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
      -- vim.cmd [[
      --   hi! link @variable Identifier
      -- ]]
    end
  },
}
