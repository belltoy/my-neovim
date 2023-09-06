return {
  'axieax/urlview.nvim',

  config = function()
    local urlview = require('urlview')

    local opts = {
      -- Command or method to open links with
      -- Options: "netrw", "system" (default OS browser), "clipboard"; or "firefox", "chromium" etc.
      -- By default, this is "netrw", or "system" if netrw is disabled
        default_action = 'system',
    }

    urlview.setup(opts)
  end
}
