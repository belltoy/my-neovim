-- Colorschemes

local function link_aerial_highlight_groups()
  vim.api.nvim_set_hl(0, "@variable",           { link = "Identifier" })
  vim.api.nvim_set_hl(0, "AerialGuide",         { link = "Comment" })
  vim.api.nvim_set_hl(0, "AerialModule",        { link = "Constant" })
  vim.api.nvim_set_hl(0, "AerialClass",         { link = "Type" })
  vim.api.nvim_set_hl(0, "AerialInterface",     { link = "@attribute" })
  vim.api.nvim_set_hl(0, "AerialStruct",        { link = "Structure" })
  vim.api.nvim_set_hl(0, "AerialClassIcon",     { link = "Special" })
  vim.api.nvim_set_hl(0, "AerialFunction",      { link = "Function" })
  vim.api.nvim_set_hl(0, "AerialTypeParameter", { link = "@lsp.type.parameter" })
  vim.api.nvim_set_hl(0, "AerialConstant",      { link = "Constant" })
end

local function link_cmp_item_hl()
  vim.api.nvim_set_hl(0, "CmpItemKindStruct",      { link = "@lsp.type.struct" })
  vim.api.nvim_set_hl(0, "CmpItemKindOperator",      { link = "@lsp.type.operator" })
  vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { link = "@lsp.type.parameter" })
  vim.api.nvim_set_hl(0, "CmpItemKindText",         { link = "@lsp.type.string" })
  vim.api.nvim_set_hl(0, "CmpItemKindMethod",       { link = "@lsp.type.method" })
  vim.api.nvim_set_hl(0, "CmpItemKindFunction",     { link = "@lsp.type.function" })
  vim.api.nvim_set_hl(0, "CmpItemKindConstructor",  { link = "@constructor" })
  vim.api.nvim_set_hl(0, "CmpItemKindField",        { link = "@lsp.type.variable" })
  vim.api.nvim_set_hl(0, "CmpItemKindVariable",     { link = "@lsp.type.variable" })
  vim.api.nvim_set_hl(0, "CmpItemKindClass",        { link = "@lsp.type.class" })
  vim.api.nvim_set_hl(0, "CmpItemKindInterface",    { link = "@lsp.type.interface" })
  vim.api.nvim_set_hl(0, "CmpItemKindModule",       { link = "@lsp.type.namespace" })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty",     { link = "@lsp.type.property" })
  vim.api.nvim_set_hl(0, "CmpItemKindUnit",         { link = "@lsp.type.enum" })
  vim.api.nvim_set_hl(0, "CmpItemKindValue",        { link = "@lsp.type.variable" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnum",         { link = "@lsp.type.enum" })
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword",      { link = "@lsp.type.keyword" })
  -- vim.api.nvim_set_hl(0, "CmpItemKindSnippet",      { link = "@lsp.type.snippet" })
  -- vim.api.nvim_set_hl(0, "CmpItemKindColor",        { link = "@lsp.type.color" })
  vim.api.nvim_set_hl(0, "CmpItemKindFile",         { link = "@label" })
  vim.api.nvim_set_hl(0, "CmpItemKindReference",    { link = "LspReferenceText" })
  vim.api.nvim_set_hl(0, "CmpItemKindFolder",       { link = "Directory" })
  vim.api.nvim_set_hl(0, "CmpItemKindEnumMember",   { link = "@lsp.type.enumMember" })
  vim.api.nvim_set_hl(0, "CmpItemKindConstant",     { link = "@constant" })
end

return {
  'rebelot/kanagawa.nvim',
  'lunarvim/darkplus.nvim',
  'EdenEast/nightfox.nvim',
  'scottmckendry/cyberdream.nvim',
  'marko-cerovac/material.nvim',
  'Mofiqul/dracula.nvim',
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  'folke/tokyonight.nvim',
  'rmehri01/onenord.nvim',
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      -- require('onedark').load()
      -- vim.cmd.colorscheme('onedark')
    end,
  },

  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    lazy = false,
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },

  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd [[ colorscheme NeoSolarized ]]
    end
  },

  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      -- vim.cmd.colorscheme('gruvbox-material')
    end
  },

  {
    'belltoy/molokai',
    config = function()
      vim.cmd.colorscheme('molokai')
      link_aerial_highlight_groups()
      link_cmp_item_hl()
    end
  },
}
