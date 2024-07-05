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

-- vim.g.vim_markdown_folding_disabled = 1
-- vim.cmd[[
-- let g:vim_markdown_fenced_languages = [ 'sh=bash' ]
-- ]]
-- vim.cmd [[
-- let g:markdown_fenced_languages = [ 'bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css', 'rust', 'sql']
-- let g:vim_markdown_fenced_languages = [ 'sh=bash', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css', 'rust', 'sql']
-- ]]
-- vim.g.startify_change_to_dir = 0
vim.g.polyglot_disabled = { 'autoindent' }

vim.g.Illuminate_ftblacklist = { 'nerdtree', 'NvimTree' }
vim.g.polyglot_disabled = {'autoindent'}

vim.g.copilot_node_command = 'node'

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


-- -- Disabled nvim-cmp temporarily because it's not working well with Github copilot
-- require "user.cmp"
-- require "user.alpha"
require "user.autocommands"
-- require "user.notify"
-- require "user.urlview"
-- require "user.rust-tools"
-- require "user.transparent"
-- require "user.smart-splits"
--
-- require "user.myerlang"
