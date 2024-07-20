local on_attach = function(bufnr)
  local function opts(desc)
    return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local crates = require('crates')
  local keymap = vim.keymap.set
  keymap("n", "<leader>rt", crates.toggle, opts("Toggle Crates virtual text"))
  keymap("n", "<leader>rr", crates.reload, opts("Reload Crates info"))

  keymap("n", "<leader>rv", crates.show_versions_popup, opts("Show Crate versions"))
  keymap("n", "<leader>rf", crates.show_features_popup, opts("Show Crate features"))
  keymap("n", "<leader>rd", crates.show_dependencies_popup, opts("Show Crate dependencies"))

  keymap("n", "<leader>ru", crates.update_crate, opts("Update crate"))
  keymap("v", "<leader>ru", crates.update_crates, opts("Update crates"))
  keymap("n", "<leader>ra", crates.update_all_crates, opts("Update all crates"))
  keymap("n", "<leader>rU", crates.upgrade_crate, opts("Upgrade crate"))
  keymap("v", "<leader>rU", crates.upgrade_crates, opts("Upgrade crates"))
  keymap("n", "<leader>rA", crates.upgrade_all_crates, opts("Upgrade all crates"))

  keymap("n", "<leader>rx", crates.expand_plain_crate_to_inline_table, opts("Expand plain crate to inline table"))
  keymap("n", "<leader>rX", crates.extract_crate_into_table, opts("Extract crate into table"))

  keymap("n", "<leader>rH", crates.open_homepage, opts("Open crate homepage"))
  keymap("n", "<leader>rR", crates.open_repository, opts("Open Git repository"))
  keymap("n", "<leader>rD", crates.open_documentation, opts("Open docs.rs"))
  keymap("n", "<leader>rC", crates.open_crates_io, opts("Open crates.io"))
  keymap("n", "<leader>rL", crates.open_lib_rs, opts("Open lib.rs"))
end

return {
  'rust-lang/rust.vim',

  -- Debugging
  -- "mfussenegger/nvim-dap",

  {
    'saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup({
        thousands_separator = ",",
        popup = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        },
        on_attach = on_attach,
      })

    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = function()
      -- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local opts = {
        -- Plugin configuration
        tools = {
          float_win_config = {
            width = 80,
            border = "rounded",
          }
        },
        -- LSP configuration
        server = {
          cmd = {
            'rust-analyzer', '--log-file', vim.fn.stdpath('log') .. '/rust-analyzer.log'
          },
          on_attach = function(client, bufnr)
            -- Use mason on_attach settings
            require('user.mason_settings').on_attach(client, bufnr)

            vim.api.nvim_set_option_value("formatexpr", "v:lua.vim.lsp.formatexpr()", {buf = bufnr})
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", {buf = bufnr})
            vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", {buf = bufnr})
          end,
          capabilities = capabilities,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              checkOnSave = {
                command = "clippy"
              },
            },
          },
        },

        -- DAP configuration
        dap = {
        },
      }

      vim.g.rustaceanvim = opts
    end,
  },
}
