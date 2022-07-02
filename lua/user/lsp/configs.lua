local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

local lspconfig = require('lspconfig')

local servers = {
    'clojure_lsp',
    'ccls',
    'cssls',
    'cssmodules_ls',
    'dockerls',
    'eslint',

    -- See:
    -- - https://github.com/znck/grammarly/tree/main/packages/grammarly-languageserver
    -- - https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/grammarly.lua
    -- - https://github.com/williamboman/nvim-lsp-installer/discussions/805
    -- "grammarly",
    'ltex',

    'gopls',
    'html',
    'jsonls',
    'jdtls', -- Java
    'marksman', -- Markdown
    'sumneko_lua',
    'sourcekit', -- Swift
    'rust_analyzer',
    'tsserver',
    'pyright',
    'yamlls',
    'bashls',
    'taplo', -- Toml
    'erlangls',
    'elixirls',
}

lsp_installer.setup({
    ensure_installed = servers,
    -- log_level = vim.log.levels.DEBUG,
})

for _, server in pairs(servers) do
    local opts = {
        on_attach = require('user.lsp.handlers').on_attach,
        capabilities = require('user.lsp.handlers').capabilities,
    }

    local has_custom_opts, server_custom_opts = pcall(require, 'user.lsp.settings.' .. server)

    if has_custom_opts then
        opts = vim.tbl_deep_extend('force', server_custom_opts, opts)
    end

    -- rust-tools conflict
    -- See https://github.com/simrat39/rust-tools.nvim/issues/183
    local rust_tools_status_ok, rust_tools = pcall(require, 'rust-tools')
    if server == 'rust_analyzer' and rust_tools_status_ok then
        local rust_opts = require('user.rust-tools')
        rust_opts.server.on_attach = opts.on_attach
        rust_tools.setup(rust_opts)
    else
        lspconfig[server].setup(opts)
    end
end
