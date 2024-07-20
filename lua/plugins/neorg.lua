return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-neorg/neorg-telescope", dependencies = { "nvim-telescope/telescope.nvim" } },
  },
  config = function()
    vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, { pattern = '*.norg', command = 'setlocal filetype=norg', })
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "norg",
      callback = function()
        local keymap = vim.keymap.set
        keymap("n", "<leader>Nl", "<Plug>(neorg.pivot.list.toggle)", { desc = "Toggle a List from Ordered <-> Unordered", buffer = true })
        keymap("n", "<localleader>fh", "<Plug>(neorg.telescope.search_headings)", {desc = "Search headings in the current file", buffer = true})
        keymap("n", "<localleader>fb", "<Plug>(neorg.telescope.backlinks.file_backlinks)", {desc = "Search file backlinks", buffer = true})
        keymap("n", "<localleader>fB", "<Plug>(neorg.telescope.backlinks.header_backlinks)", {desc = "Search header backlinks", buffer = true})
        keymap("n", "<localleader>fl", "<Plug>(neorg.telescope.find_linkable)", {desc = "Find linkable", buffer = true})
        keymap("n", "<localleader>ff", "<Plug>(neorg.telescope.find_norg_files)", {desc = "Find norg file", buffer = true})
        keymap("n", "<localleader>il", "<Plug>(neorg.telescope.insert_link)", {desc = "Insert link", buffer = true})
        keymap("n", "<localleader>iL", "<Plug>(neorg.telescope.insert_file_link)", {desc = "Insert file link", buffer = true})
        keymap("n", "<localleader>nM", "<cmd>Neorg inject-metadata<cr>", {desc = "Inject Metadata", buffer = true})
        keymap("n", "<localleader>W", "<Plug>(neorg.telescope.switch_workspace)", {desc = "Switch workspace", buffer = true})
        keymap("n", "<localleader>o", "<cmd>Neorg toc<cr>", {desc = "TOC", buffer = true})
      end,
    })

    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.keybinds"] = {
          config = {
            hook = function(keybinds)
              print("Hooking Neorg keybinds")
              keybinds.remap_event("norg", "n", "<LocalLeader>fo", "core.looking-glass.magnify-code-block", {desc = "Magnify code block"})
              -- keybinds.map("norg", "n", "<LocalLeader>p", "<Cmd>Neorg presenter start<CR>", {desc = "Start the Neorg presenter"})
              -- keybinds.map("norg", "n", "<LocalLeader>v", require("nabla").popup, {desc = "Open Neorg popup"})
              -- keybinds.map("norg", "n", "<leader>fnh", "<Cmd>Telescope neorg search_headers<CR>", {desc = "Search the headers in the current file"})
              -- keybinds.map("norg", "n", "<leader>fnl", "<Cmd>Telescope neorg find_linkable<CR>", {desc = "Find linkable in the current file"})
              -- keybinds.map("norg", "n", "<LocalLeader>il", "<Cmd>Telescope neorg insert_file_link<CR>", {desc = "Insert file link"})
            end,
                    },
        },
        ["core.integrations.treesitter"] = {},
        ["core.integrations.telescope"] = {
          config = {
            insert_file_link = {
                -- Whether to show the title preview in telescope. Affects performance with a large
                -- number of files.
                show_title_preview = true,
            },
          }
        },
        ["core.ui.calendar"] = {},
        ["core.looking-glass"] = {},
        ["core.concealer"] = {
          config = {
            icon_preset = "varied",
            -- icons = { code_block = { conceal = true, width = 120 } },
          },
        },                  -- Adds pretty icons to your documents
        ["core.summary"] = {},
        ["core.export"] = {},
        ["core.export.markdown"] = {
          config = {
            extensions = "all",
          },
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
