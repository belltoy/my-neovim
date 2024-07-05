return {
  'rust-lang/rust.vim',

  -- Debugging
  -- "mfussenegger/nvim-dap",

  {
    'saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufRead Cargo.toml' },
    tag = 'v0.3.0',
    config = function()
      require('crates').setup()
    end,
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      local opts = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- Use mason on_attach settings
            require('user.mason_settings').on_attach(client, bufnr)
          end,
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
