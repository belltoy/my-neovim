return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',                                                        -- Only needed if you have another plugin named markdown.nvim
  -- if you prefer nvim-web-devicons
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('render-markdown').setup({
      latex = {
        enabled = false,
      },
      enabled = false,
    })
    vim.keymap.set('n', '<leader>m', '<cmd>RenderMarkdown toggle<CR>', { desc = "Render Markdown" })
  end,
}
