return {
  "sontungexpt/url-open",
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
  config = function()
    local status_ok, url_open = pcall(require, "url-open")
    if not status_ok then
      return
    end
    url_open.setup({})
    vim.keymap.set("n", "go", "<esc>:URLOpenUnderCursor<cr>", { desc = "Open URL" })
    vim.keymap.set("n", "<leader>u", "<esc>:URLOpenUnderCursor<cr>", { desc = "Open URL" })
  end,
}
