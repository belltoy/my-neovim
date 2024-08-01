-- Vim plugin for automatically highlighting other uses of the word under the cursor.
-- Integrates with Neovim's LSP client for intelligent highlighting.
return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      filetypes_denylist = {
        'NvimTree',
        'aerial',
        'trouble',
        'markdown',
        'help',
        'lazy',
        'checkhealth',
        'neo-tree',
        'lspinfo',
        'alpha',
        'toggleterm',
      }
    })
  end
}
