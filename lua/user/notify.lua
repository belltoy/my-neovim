local status_ok, notify = pcall(require, "notify")
if status_ok then
  notify.setup({
    stages = "fade",
    max_width = 70,
    max_height = 50,
    minimum_width = 3,
    -- TODO: use custom stages
    -- https://github.com/rcarriga/nvim-notify/issues/99
    on_open = function(win)
      vim.api.nvim_win_set_option(win, "wrap", true)
    end,
  })

  vim.notify = notify
end
