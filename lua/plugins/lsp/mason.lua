local servers = {
  -- 'clojure_lsp',
  'clangd',  -- C
  -- 'cssls',
  -- 'cssmodules_ls',
  'dockerls',
  -- 'eslint',
  -- 'buf',
  -- 'pbls',
  'jqls',

  'ltex',

  -- python

  'gopls',
  'html',
  'jsonls',
  'jdtls', -- Java
  'marksman', -- Markdown
  'lua_ls',
  'tsserver',
  -- 'pyright',
  'yamlls',
  'bashls',
  'taplo', -- Toml
  'elixirls',
}

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
      automatic_installation = {
        exclude = {
          "elp",
        },
      }, -- not the same as ensure_installed
    })

    mason_lspconfig.setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        -- ["rust_analyzer"] = function ()
        --     require("rust-tools").setup {}
        -- end
    }

    local on_attach = require('config.mason_settings').on_attach
    local opts = {
      on_attach = on_attach,
      -- capabilities = require('user.lsp.handlers').capabilities,
    }

    for _, server in pairs(servers) do
      local opts0 = opts

      local has_custom_opts, server_custom_opts = pcall(require, 'plugins.lsp.settings.' .. server)

      if has_custom_opts then
        opts0 = vim.tbl_deep_extend('force', server_custom_opts, opts0)
      end

      lspconfig[server].setup(opts0)
    end

    -- Manually installed lsp
    lspconfig['elp'].setup({
      on_attach = on_attach,
      -- capabilities = require('user.lsp.handlers').capabilities,
      cmd = {
        'elp', '--log-file', vim.fn.stdpath('log') .. '/elp.log', 'server'
      },
      flags = {
        exit_timeout = 0,
      },
    })

    -- lspconfig['buf'].setup({})
    lspconfig['pbls'].setup({})
  end
}
