local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
    return
end

aerial.setup({
    backends = {
        ['_']  = {"lsp", "treesitter"},
        markdown = {"markdown"},
    },
    min_width = 40,

    filter_kind = false,

    on_attach = function(bufnr)
    -- Toggle the aerial window with <leader>a
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l', '<cmd>AerialToggle!<CR>', {})
    -- -- Jump forwards/backwards with '{' and '}'
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
    -- -- Jump up the tree with '[[' or ']]'
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
  end
})
