local ext = function(table, bufnr, desc)
  local tbl = {}
  for k, v in pairs(table) do
    tbl[k] = v
  end
  tbl["desc"] = desc
  tbl["buffer"] = bufnr
  return tbl
end

local lsp_keymaps = function(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', ext(opts, bufnr, "Hover"))
  -- conflict with <c-k> for tmux navigation
  vim.keymap.set('n', '<M-o>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', ext(opts, bufnr, "Signature Help"))

  -- vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", ext(opts, bufnr, "Rename"))

  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', ext(opts, bufnr, "Goto Declaration"))
  vim.keymap.set('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', ext(opts, bufnr, "Goto Type Definition"))
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', ext(opts, bufnr, "Goto Definition"))
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', ext(opts, bufnr, "Goto Implementation"))
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', ext(opts, bufnr, "Goto References"))
  vim.keymap.set("n", "gA", "<cmd>lua vim.lsp.buf.code_action()<CR>", ext(opts, bufnr, "Code Action"))
  vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', ext(opts, bufnr, "Open Diagnostic Float"))
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', ext(opts, bufnr, "Next Diagnostic"))
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', ext(opts, bufnr, "Prev Diagnostic"))
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

local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

return {
  lsp_keymaps = lsp_keymaps,
  lsp_highlight_document = lsp_highlight_document,
  on_attach = on_attach,
}
