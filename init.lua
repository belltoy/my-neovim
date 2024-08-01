require "config.vim-options"
require "config.keymaps"

vim.g.polyglot_disabled = { 'autoindent' }

vim.g.copilot_node_command = 'node'
vim.g.loaded_perl_provider = 0

vim.lsp.log.set_format_func(vim.inspect)

require "config.lazy"

require "config.autocommands"
