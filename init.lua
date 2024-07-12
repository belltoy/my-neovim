require "user.options"
require "user.keymaps"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

vim.g.Illuminate_ftblacklist = { 'nerdtree', 'NvimTree' }
vim.g.polyglot_disabled = {'autoindent'}

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
  }
})

require "user.autocommands"
