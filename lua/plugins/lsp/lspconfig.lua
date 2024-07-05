local setup = function()
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

  require('lspconfig.ui.windows').default_options.border = 'rounded'

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

  vim.lsp.handlers['window/showMessage'] = function(_ --[[ err ]], method, params, _ --[[ client_id ]])
    vim.notify(method.message, severity[params.type])
  end
end

return {
  'neovim/nvim-lspconfig', -- enable LSP
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    setup()
  end
}
