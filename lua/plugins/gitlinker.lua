return {
  'ruifm/gitlinker.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local gitlinker = require("gitlinker")
    local map = vim.api.nvim_set_keymap

    map('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', { silent = true, desc = "Copy URL"})
    map('n', '<leader>gy', '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>', { silent = true, desc = "Copy Current line URL"})
    map('v', '<leader>gy', '<cmd>lua require"gitlinker".get_repo_url("v")<cr>', { silent = true, desc = "Copy Range URL"})
    map('n', '<leader>go', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', { silent = true, desc = "Open in browser"})

    gitlinker.setup({
      callbacks = {
        ["registry.code.tuya-inc.top"] = require "gitlinker.hosts".get_gitlab_type_url
      }
    })
  end
}
