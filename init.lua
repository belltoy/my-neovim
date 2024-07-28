require "user.options"
require "user.keymaps"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local fs_stat = vim.uv['fs_stat'] or vim.loop['fs_stat']
if not fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.polyglot_disabled = { 'autoindent' }

vim.g.copilot_node_command = 'node'
vim.g.loaded_perl_provider = 0

vim.lsp.log.set_format_func(vim.inspect)

-- Install your plugins here
require('lazy').setup({
  spec = {
    { import = 'plugins' },
    { import = 'plugins.lsp' },
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  rocks = {
    enabled = true,
  },

  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
})

require "user.autocommands"
