local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
    return
end

local lspconfig = require('lspconfig')

local servers = {
    -- 'clojure_lsp',
    -- 'clangd',  -- C
    'cssls',
    'cssmodules_ls',
    'dockerls',
    'eslint',

    -- 'denols',
    'cssmodules_ls',

    -- See:
    -- - https://github.com/znck/grammarly/tree/main/packages/grammarly-languageserver
    -- - https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/grammarly.lua
    -- - https://github.com/williamboman/nvim-lsp-installer/discussions/805
    "grammarly",
    -- 'ltex',

    'gopls',
    'html',
    'jsonls',
    'jdtls', -- Java
    'marksman', -- Markdown
    -- 'sumneko_lua',
    'lua_ls',
    -- 'sourcekit', -- Swift
    'rust_analyzer',
    'tsserver',
    'pyright',
    'yamlls',
    'bashls',
    'taplo', -- Toml
    'erlangls',
    'elixirls',
}

mason_lspconfig.setup({
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
        -- local rust_opts = require('user.rust-tools')
        -- -- rust_opts.server.on_attach = opts.on_attach
        -- rust_opts.server.on_attach = function(client, bufnr)
        --     opts.on_attach(client, bufnr)
        --     -- Hover actions
        --       vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        --       -- Code action groups
        --       vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
        -- end
        -- rust_tools.setup(rust_opts)
    else
        lspconfig[server].setup(opts)
    end
end
