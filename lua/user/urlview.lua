local status_ok, urlview = pcall(require, 'urlview')
if not status_ok then
    return
end

local opts = {
  -- Command or method to open links with
  -- Options: "netrw", "system" (default OS browser), "clipboard"; or "firefox", "chromium" etc.
  -- By default, this is "netrw", or "system" if netrw is disabled
    default_action = 'system',
}

local tele_status_ok, telescope = pcall(require, 'telescope')
if tele_status_ok then
  opts.default_packer = 'telescope'
end

-- telescope.load_extension('urlview')

-- urlview support neovim v0.7 with breaking changes
-- See https://github.com/axieax/urlview.nvim/issues/34

urlview.setup(opts)
