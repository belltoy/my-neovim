local M = {}

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = 'DiagnosticSignError', text = '' },
        { name = 'DiagnosticSignWarn', text = '' },
        { name = 'DiagnosticSignHint', text = '' },
        { name = 'DiagnosticSignInfo', text = '' },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    }

    vim.diagnostic.config(config)

    local popup_opts = {
        border = 'rounded',
        max_width = 100, -- should be worked
        max_height = 80,
    }

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, popup_opts)
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, popup_opts)

    -- table from lsp severity to vim severity.
    local severity = {
        'error',
        'warn',
        'info',
        'info', -- map both hint and info to info?
    }
    vim.lsp.handlers['window/showMessage'] = function(err, method, params, client_id)
        vim.notify(method.message, severity[params.type])
    end
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    local status_ok, illuminate = pcall(require, 'illuminate')
    if not status_ok then
        return
    end
    illuminate.on_attach(client)

    vim.api.nvim_command([[ hi def link LspReferenceText CursorLine ]])
    vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
    vim.api.nvim_command([[ hi def link LspReferenceRead CursorLine ]])
    -- end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        'gl',
        '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

local function aerial_setup(client, bufnr)
    local status_ok, aerial = pcall(require, 'aerial')
    if not status_ok then
        return
    end
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>t', '<cmd>AerialToggle!<CR>', {})
    aerial.on_attach(client, bufnr)
end

M.on_attach = function(client, bufnr)
    -- vim.notify(client.name .. ' starting...')
    -- TODO: refactor this into a method that checks if string in list
    if client.name == 'tsserver' then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
    aerial_setup(client, bufnr)
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--
-- local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not status_ok then
--   return
-- end
--
-- M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
