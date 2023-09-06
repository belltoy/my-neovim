return {
  'ruifm/gitlinker.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local gitlinker = require("gitlinker")

    vim.api.nvim_set_keymap('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', { silent = true })
    vim.api.nvim_set_keymap('n', '<leader>gB',
    '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
    { silent = true })
    vim.api.nvim_set_keymap('n', '<leader>go',
    '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
    { silent = true })

    gitlinker.setup({
      callbacks = {
        ["registry.code.tuya-inc.top"] = require "gitlinker.hosts".get_gitlab_type_url
      }
    })
  end
}
