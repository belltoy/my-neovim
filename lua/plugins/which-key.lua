local opts = {
  preset = "modern",
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 19, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+ ', -- symbol prepended to a group
    rules = {
      { pattern = "diagnostic",                 icon = "  ", color = "Red" },
      { pattern = "expand plain crate to inline",  icon = "󰅪 ",  hl = "Function" },
      { pattern = "extract crate into table",   icon = "󰅪 ",  hl = "Function" },
      { pattern = "toggle",                     icon = "  ", color = "Yellow" },
      { pattern = "update",                     icon = "  ", color = "Cyan" },
      { pattern = "upgrade",                    icon = "  ", hl = "Function" },
      { pattern = "search",                     icon = "  ", hl = "Function" },
      { pattern = "info",                       icon = " ",  hl = "Type" },
      { pattern = "git",                        icon = "󰊢 ",  color = "Red" },
      { pattern = "open",                       icon = " ",  hl = "DevIconHexadecimal" },
      { pattern = "crate",                      icon = " ",  hl = "DevIconRs" },
      { pattern = "split window |",             icon = " ",  hl = "VertSplit" },
      { pattern = "start screen",               icon = "󰷜 ",  hl = "Constant" },
      { pattern = "close buffer",               icon = "󰅙 ",  color = "Red" },
      { pattern = "save",                       icon = " ",  color = "Blue" },
      { pattern = "treesitter",                 icon = " ",  color = "Green" },
      { pattern = "render markdown",            icon = " ",  color = "Purple" },
      { pattern = "trouble",                    icon = "󱜸 ",  color = "Yellow" },
      { pattern = "project",                    icon = "󰊢 ",  color = "Yellow" },
      { pattern = "no highlight search",        icon = "󰹏 ",  color = "Yellow" },
      -- { pattern = "toggle highlight search", icon = "  ", color = "Yellow" },
      { pattern = "format",                     icon = "󰁨  ", hl = "Type" },
      { pattern = "lsp",                        icon = " ",  hl = "Type" },
      { pattern = "undo",                       icon = "󰕍 ",  hl = "Type" },
      -- { pattern = "quit",                    icon = "󰈆 ",  hl = "DevIconDefault" },
      { pattern = "rename",                     icon = "󰑕  ", hl = "Identifier" },
      { pattern = "increase indent",            icon = "󰔰 ",  hl = "Function" },
      { pattern = "decrease indent",            icon = "󰶢 ",  hl = "Function" },
      { pattern = "trim",                       icon = "󰁨 ",  color = "Red" },
      { pattern = "outline",                    icon = "󰊕 ",  hl = "Function" },
      { pattern = "maximize/minimize a split",  icon = "󰊓 ",  hl = "Function" },
    },
  },
  sort = { "manual" },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true,
  triggers = {
    { "<auto>", mode = "nxsotc" },
  },

  spec = {
    {"<esc>",            "<cmd>nohls<CR>",                                                              desc = "No Highlight Search",           nowait = true,   remap = false },

    { "<leader><space>", "<cmd>StartScreen<CR>",                                                        desc = "Start Screen",                  nowait = true,   remap = false },
    { "<leader>w",       "<cmd>w!<CR>",                                                                 desc = "Save",                          nowait = true,   remap = false },
    { "<leader>d",       "<cmd>Bdelete!<CR>",                                                           desc = "Close Buffer",                  nowait = true,   remap = false },

    { "<leader>P",       "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>",              desc = "Selete Project",                nowait = true,   remap = false },
    { "<leader>W",       "<cmd>Trim<CR>",                                                               desc = "Trim Trailing Whitespaces",     nowait = true,   remap = false },
    { "<leader>b",       "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                desc = "Git Blame Current Line",        nowait = true,   remap = false },

    { "<leader>g",       group = "Git",                                                                 nowait = true,                          remap = false },
    { "<leader>gB",      "<cmd>Telescope git_branches<cr>",                                             desc = "Checkout branch",               nowait = true,   remap = false },
    { "<leader>gR",      "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                              desc = "Reset Buffer",                  nowait = true,   remap = false },
    { "<leader>gb",      "<cmd>Git blame<CR>",                                                          desc = "Git Blame",                     nowait = true,   remap = false },
    { "<leader>gc",      "<cmd>Telescope git_commits<cr>",                                              desc = "Checkout commit",               nowait = true,   remap = false },
    { "<leader>gd",      "<cmd>Gitsigns diffthis HEAD<cr>",                                             desc = "Diff",                          nowait = true,   remap = false },
    { "<leader>gh",      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                              desc = "Preview Hunk",                  nowait = true,   remap = false },
    { "<leader>gj",      "<cmd>lua require 'gitsigns'.next_hunk()<cr>",                                 desc = "Next Hunk",                     nowait = true,   remap = false },
    { "<leader>gk",      "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",                                 desc = "Prev Hunk",                     nowait = true,   remap = false },
    { "<leader>gl",      "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                desc = "Blame Whole File",              nowait = true,   remap = false },
    { "<leader>go",      "<cmd>Telescope git_status<cr>",                                               desc = "Open changed file",             nowait = true,   remap = false },
    { "<leader>gp",      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                              desc = "Preview Hunk",                  nowait = true,   remap = false },
    { "<leader>gr",      "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                                desc = "Reset Hunk",                    nowait = true,   remap = false },
    { "<leader>gs",      "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                                desc = "Stage Hunk",                    nowait = true,   remap = false },
    { "<leader>gu",      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                           desc = "Undo Stage Hunk",               nowait = true,   remap = false },
    { "<leader>gU",      "<cmd>lua require('nvim-gitui').open_gitui()<cr>",                             desc = "GitUI",                         nowait = true,   remap = false },

    -- { "<leader>s",       "<cmd>split<CR>",                                                              desc = "Split window —— ",              nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" }},
    { "<leader>-",       "<cmd>split<CR>",                                                              desc = "Split window —— ",              nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" }},
    -- { "<leader>v",       "<cmd>vsplit<CR>",                                                             desc = "Split window | Current Buffer", nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" }},
    { "<leader>|",       "<cmd>vsplit<CR>",                                                             desc = "Split window | Current Buffer", nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" }},
    { "<leader>V",       "<cmd>SplitStartScreen<CR>",                                                   desc = "Split window | Start Screen",   nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" } },
    -- { "<leader>q",       "<cmd>q!<CR>",                                                                 desc = "Quit",                          nowait = true,   remap = false },

    { "<leader>S",       group = "Search",                                                              nowait = true,                          remap = false },
    { "<leader>SC",      "<cmd>Telescope commands<cr>",                                                 desc = "Commands",                      nowait = true,   remap = false },
    { "<leader>SM",      "<cmd>Telescope man_pages<cr>",                                                desc = "Man Pages",                     nowait = true,   remap = false },
    { "<leader>SR",      "<cmd>Telescope registers<cr>",                                                desc = "Registers",                     nowait = true,   remap = false },
    { "<leader>Sb",      "<cmd>Telescope git_branches<cr>",                                             desc = "Checkout branch",               nowait = true,   remap = false },
    { "<leader>Sc",      "<cmd>Telescope colorscheme<cr>",                                              desc = "Colorscheme",                   nowait = true,   remap = false },
    { "<leader>Sh",      "<cmd>Telescope help_tags<cr>",                                                desc = "Find Help",                     nowait = true,   remap = false },
    { "<leader>Sk",      "<cmd>Telescope keymaps<cr>",                                                  desc = "Keymaps",                       nowait = true,   remap = false },
    { "<leader>Sr",      "<cmd>Telescope oldfiles<cr>",                                                 desc = "Open Recent File",              nowait = true,   remap = false },

    { "<leader>T",       group = "TreeSitter",                                                                                                  nowait = true,   remap = false },
    { "<leader>Tb",      "<cmd>TSBufToggle highlight<CR>",                                              desc = "TSBufToggle highlight",         nowait = true,   remap = false },
    { "<leader>Tt",      "<cmd>TSToggle highlight<CR>",                                                 desc = "TSToggle highlight",            nowait = true,   remap = false },

    { "<leader>l",       group = "LSP",                                                                                                         nowait = true,   remap = false },
    { "<leader>lM",      "<cmd>Mason<cr>",                                                              desc = "Installer Info",                nowait = true,   remap = false },
    { "<leader>lS",      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                            desc = "Workspace Symbols",             nowait = true,   remap = false },
    { "<leader>la",      "<cmd>lua vim.lsp.buf.code_action()<cr>",                                      desc = "Code Action",                   nowait = true,   remap = false },
    { "<leader>ld",      "<cmd>Telescope diagnostics bufnr=0<cr>",                                      desc = "Diagnostics (Current Buffer)",  nowait = true,   remap = false },
    { "<leader>lf",      "<cmd>lua vim.lsp.buf.format { async = true }<cr>",                            desc = "Format (conform)",              nowait = true,   remap = false },
    { "<leader>lh",      "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", desc = "Toggle Inlay Hint",             nowait = true,   remap = false },
    { "<leader>lI",      "<cmd>LspInfo<cr>",                                                            desc = "Info",                          nowait = true,   remap = false },
    { "<leader>lj",      "<cmd>lua vim.diagnostic.goto_next()<CR>",                                     desc = "Next Diagnostic",               nowait = true,   remap = false },
    { "<leader>lk",      "<cmd>lua vim.diagnostic.goto_prev()<cr>",                                     desc = "Prev Diagnostic",               nowait = true,   remap = false },
    { "<leader>ll",      "<cmd>lua vim.lsp.codelens.run()<cr>",                                         desc = "CodeLens Action",               nowait = true,   remap = false },
    { "<leader>lq",      "<cmd>lua vim.diagnostic.setloclist()<cr>",                                    desc = "Quickfix",                      nowait = true,   remap = false },
    { "<leader>lr",      "<cmd>lua vim.lsp.buf.rename()<cr>",                                           desc = "Rename",                        nowait = true,   remap = false },
    { "<leader>ls",      "<cmd>Telescope lsp_document_symbols<cr>",                                     desc = "Document Symbols",              nowait = true,   remap = false },
    { "<leader>lw",      "<cmd>Telescope diagnostics<cr>",                                              desc = "Diagnostics (Workspace)",       nowait = true,   remap = false },

    { "<leader>f",       group = "Telescope",                                                           nowait = true,                          remap = false },
    { "<leader>x",       group = "Trouble",                                                             nowait = true,                          remap = false },
  },
}

return {
  'folke/which-key.nvim',

  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  opts = opts,
}
