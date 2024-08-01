return {
  'preservim/vim-markdown',

  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown',
    -- Only needed if you have another plugin named markdown.nvim
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
        bullet = {
          -- Turn on / off list bullet rendering
          enabled = true,
          -- Replaces '-'|'+'|'*' of 'list_item'
          -- How deeply nested the list is determines the 'level'
          -- The 'level' is used to index into the array using a cycle
          -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
          icons = { '● ', '○ ', '◆ ', '◇ ' },
          -- Padding to add to the right of bullet point
          right_pad = 0,
          -- Highlight for the bullet icon
          highlight = 'RenderMarkdownBullet',
        },
      })
      vim.keymap.set('n', '<leader>m', '<cmd>RenderMarkdown toggle<CR>', { desc = "Render Markdown" })
    end,
  }
}
