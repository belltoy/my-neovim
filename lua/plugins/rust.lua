local on_attach = require('user.mason_settings').on_attach;

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
    'simrat39/rust-tools.nvim',
    config = function()
      local rust_tools = require('rust-tools')
      local opts = {
          tools = { -- rust-tools options
              -- automatically set inlay hints (type hints)
              -- There is an issue due to which the hints are not applied on the first
              -- opened file. For now, write to the file to trigger a reapplication of
              -- the hints or just run :RustSetInlayHints.
              -- default: true
              autoSetHints = true,

              -- how to execute terminal commands
              -- options right now: termopen / quickfix
              executor = require("rust-tools/executors").termopen,

              -- callback to execute once rust-analyzer is done initializing the workspace
              -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
              on_initialized = nil,

              -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
              reload_workspace_from_cargo_toml = true,

              -- These apply to the default RustSetInlayHints command
              inlay_hints = {

                  -- Only show inlay hints for the current line
                  only_current_line = true,

                  -- Event which triggers a refersh of the inlay hints.
                  -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
                  -- not that this may cause higher CPU usage.
                  -- This option is only respected when only_current_line and
                  -- autoSetHints both are true.
                  only_current_line_autocmd = "CursorHold",

                  -- whether to show parameter hints with the inlay hints or not
                  -- default: true
                  show_parameter_hints = true,

                  -- whether to show variable name before type hints with the inlay hints or not
                  -- default: false
                  show_variable_name = false,

                  -- prefix for parameter hints
                  -- default: "<-"
                  parameter_hints_prefix = "<- ",

                  -- prefix for all the other hints (type, chaining)
                  -- default: "=>"
                  other_hints_prefix = "=> ",

                  -- whether to align to the lenght of the longest line in the file
                  max_len_align = false,

                  -- padding from the left if max_len_align is true
                  max_len_align_padding = 1,

                  -- whether to align to the extreme right or not
                  right_align = false,

                  -- padding from the right if right_align is true
                  right_align_padding = 7,

                  -- The color of the hints
                  highlight = "Comment",
              },

              -- options same as lsp hover / vim.lsp.util.open_floating_preview()
              hover_actions = {
                  -- the border that is used for the hover window
                  -- see vim.api.nvim_open_win()
                  border = {
                      { "╭", "FloatBorder" },
                      { "─", "FloatBorder" },
                      { "╮", "FloatBorder" },
                      { "│", "FloatBorder" },
                      { "╯", "FloatBorder" },
                      { "─", "FloatBorder" },
                      { "╰", "FloatBorder" },
                      { "│", "FloatBorder" },
                  },

                  -- whether the hover action window gets automatically focused
                  -- default: false
                  auto_focus = false,
              },

              -- settings for showing the crate graph based on graphviz and the dot
              -- command
              crate_graph = {
                  -- Backend used for displaying the graph
                  -- see: https://graphviz.org/docs/outputs/
                  -- default: x11
                  backend = "png",
                  -- where to store the output, nil for no output stored (relative
                  -- path from pwd)
                  -- default: nil
                  output = nil,
                  -- true for all crates.io and external crates, false only the local
                  -- crates
                  -- default: true
                  full = true,

                  -- List of backends found on: https://graphviz.org/docs/outputs/
                  -- Is used for input validation and autocompletion
                  -- Last updated: 2021-08-26
                  enabled_graphviz_backends = {
                      "bmp",
                      "cgimage",
                      "canon",
                      "dot",
                      "gv",
                      "xdot",
                      "xdot1.2",
                      "xdot1.4",
                      "eps",
                      "exr",
                      "fig",
                      "gd",
                      "gd2",
                      "gif",
                      "gtk",
                      "ico",
                      "cmap",
                      "ismap",
                      "imap",
                      "cmapx",
                      "imap_np",
                      "cmapx_np",
                      "jpg",
                      "jpeg",
                      "jpe",
                      "jp2",
                      "json",
                      "json0",
                      "dot_json",
                      "xdot_json",
                      "pdf",
                      "pic",
                      "pct",
                      "pict",
                      "plain",
                      "plain-ext",
                      "png",
                      "pov",
                      "ps",
                      "ps2",
                      "psd",
                      "sgi",
                      "svg",
                      "svgz",
                      "tga",
                      "tiff",
                      "tif",
                      "tk",
                      "vml",
                      "vmlz",
                      "wbmp",
                      "webp",
                      "xlib",
                      "x11",
                  },
              },
          },

          -- all the opts to send to nvim-lspconfig
          -- these override the defaults set by rust-tools.nvim
          -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
          server = {
              -- standalone file support
              -- setting it to false may improve startup time
              standalone = true,
              settings = {
                  ["rust-analyzer"] = {
                      assist = {
                          importGranularity = "module",
                          importPrefix = "by_self",
                      },
                      cargo = {
                          loadOutDirsFromCheck = true,
                          features = "all",
                      },
                      procMacro = {
                          enable = true,
                      },
                  },
              },
              on_attach = function(client, bufnr)
                  on_attach(client, bufnr)
                  -- Hover actions
                  vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                  -- Code action groups
                  vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
              end
          }, -- rust-analyer options

          -- debugging stuff
          -- dap = {
          --     adapter = {
          --         type = "executable",
          --         command = "lldb-vscode",
          --         name = "rt_lldb",
          --     },
          -- },
      }
      require('rust-tools').setup(opts)
    end
  }
}
