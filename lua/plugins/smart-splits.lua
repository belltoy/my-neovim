return {
  'mrjones2014/smart-splits.nvim',

  config = function()
    require('smart-splits').setup({
        -- Ignored filetypes (only while resizing)
        ignored_filetypes = {
            'nofile',
            'quickfix',
            'prompt',
        },
        -- Ignored buffer types (only while resizing)
        ignored_buftypes = { 'NvimTree' },
        -- the default number of lines/columns to resize by at a time
        default_amount = 3,
    })

    -- recommended mappings
    -- resizing splits
    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
  end
}
