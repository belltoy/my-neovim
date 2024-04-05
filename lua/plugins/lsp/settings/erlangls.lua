local nvim_lsp = require 'lspconfig'

local opts = {
  cmd = {
    "/Users/belltoy/bin/erlang_ls", "--transport", "stdio"
  },
  -- root_dir = nvim_lsp.util.root_pattern(".git", "rebar.config"),
  root_dir = nvim_lsp.util.root_pattern(".git"),
}

return opts
