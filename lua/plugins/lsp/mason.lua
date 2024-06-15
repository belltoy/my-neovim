local servers = {
  -- 'clojure_lsp',
  'clangd',  -- C
  'cssls',
  'cssmodules_ls',
  'dockerls',
  'eslint',
  'bufls',
  'jqls',

  -- 'denols',
  'cssmodules_ls',

  'ltex',

  -- python
  -- 'debugpy',
  -- 'black',
  -- 'ruff',

  'gopls',
  'html',
  'jsonls',
  'jdtls', -- Java
  'marksman', -- Markdown
  -- 'sumneko_lua',
  'lua_ls',
  -- 'sourcekit', -- Swift
  -- 'rust_analyzer',
  'tsserver',
  'pyright',
  'yamlls',
  'bashls',
  'taplo', -- Toml
  -- 'erlangls',
  'elp',
  'elixirls',
}

local on_attach = require('user.mason_settings').on_attach

return {
  'williamboman/mason.nvim', -- simple to use language server installer, replaced williamboman/nvim-lsp-installer
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig', -- enable LSP
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = '',
          package_uninstalled = '',
          -- package_pending = '',
          package_pending = '→',
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = servers,

      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    for _, server in pairs(servers) do
        local opts = {
            on_attach = on_attach,
            -- capabilities = require('user.lsp.handlers').capabilities,
        }

        local has_custom_opts, server_custom_opts = pcall(require, 'plugins.lsp.settings.' .. server)

        if has_custom_opts then
            opts = vim.tbl_deep_extend('force', server_custom_opts, opts)
        end

        lspconfig[server].setup(opts)
    end
  end
}
