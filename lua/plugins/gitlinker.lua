return {
  'ruifm/gitlinker.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local gitlinker = require("gitlinker")

    gitlinker.setup({
      callbacks = {
        ["registry.code.tuya-inc.top"] = require "gitlinker.hosts".get_gitlab_type_url
      }
    })

    -- local map = vim.api.nvim_set_keymap
    local map = vim.keymap.set
    local get_buf_range_url = function()
      gitlinker.get_buf_range_url("n")
    end
    local open_in_browser = function()
      gitlinker.get_repo_url({
        action_callback = require"gitlinker.actions".open_in_browser
      })
    end
    local get_repo_url_v = function()
      gitlinker.get_repo_url("v")
    end

    map('n', '<leader>gY', gitlinker.get_repo_url, { silent = true, desc = "Copy URL"})
    map('n', '<leader>gy', get_buf_range_url, { silent = true, desc = "Copy Current line URL"})
    map('v', '<leader>gy', get_repo_url_v, { silent = true, desc = "Copy Range URL"})
    map('n', '<leader>gO', open_in_browser, { silent = true, desc = "Open in browser"})
  end
}
