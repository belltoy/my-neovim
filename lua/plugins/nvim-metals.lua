local api = vim.api
return {
  'scalameta/nvim-metals',
  as = "metals",
  ft = { "scala", "sbt", "java" },
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        dap.configurations.scala = {
          {
            type = "metals",
            request = "launch",
            name = "runortest",
            metals = {
              runttype = "runortestfile",
            },
          },
          {
            type = "scala",
            request = "launch",
            name = "test target",
            metals = {
              runttype = "testtarget",
            },
          },
        }
      end,
    },
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local metals = require("metals")
    local metals_config = metals.bare_config()
    metals_config.settings = {
      showImplicitArguments = true,
    }
    metals_config.init_options.statusBarProvider = "on"
    -- metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    local dap = require("dap")
    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
          runtType = "runOrTestFile",
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runtType = "testTarget",
        },
      },
    }

    metals_config.on_attach = function(_, _)
      metals.setup_dap()
    end

    metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
          prefix = '',
        }
      }
    )

    vim.keymap.set("n", "<leader>lmc", function()
      require("telescope").extensions.metals.commands()
    end)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
    vim.keymap.set("n", "lr", vim.lsp.buf.references)
    vim.keymap.set("n", "gr", vim.lsp.buf.references)
    vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
    vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
    vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

    local nvim_metals_group = api.nvim_create_augroup("metals", { clear = true })
    api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        metals.initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
