local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local workspace_symbols = telescope_builtin.lsp_dynamic_workspace_symbols

local toggle_inlay = function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({})) end
local format = function() vim.lsp.buf.format({async = true}) end
local find_buf_diagnostics = function() telescope_builtin.diagnostics({ bufnr=0 }) end
local find_workspace_diagnostics = telescope_builtin.diagnostics
local find_projects = telescope.extensions.projects.projects
local find_doc_symbols = telescope_builtin.lsp_document_symbols

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
      { pattern = "toggle",                     icon = "󰛨 ", color = "Yellow" },
      { pattern = "update",                     icon = " ", color = "Cyan" },
      { pattern = "upgrade",                    icon = " ", hl = "Function" },
      { pattern = "incoming",                   icon = "󰏷 ", hl = "Function" },
      { pattern = "outgoing",                   icon = "󰏻 ", hl = "Function" },
      { pattern = "search",                     icon = " ", hl = "Function" },
      { pattern = "find",                       icon = "󰈞 ", hl = "Function" },
      { pattern = "git",                        icon = "󰊢 ",  color = "Red" },
      { pattern = "diff",                       icon = "󰫙 ",  color = "Red" },
      { pattern = "open",                       icon = " ",  hl = "DevIconHexadecimal" },
      { pattern = "todo",                       icon = " ",  hl = "DevIconHexadecimal" },
      { pattern = "list",                       icon = " ",  hl = "DevIconHexadecimal" },
      { pattern = "crate",                      icon = " ",  hl = "DevIconRs" },
      { pattern = "split window |",             icon = " ",  hl = "VertSplit" },
      { pattern = "start screen",               icon = "󰷜 ",  hl = "Constant" },
      { pattern = "close buffer",               icon = "󰅙 ",  color = "Red" },
      { pattern = "save",                       icon = " ",  color = "Blue" },
      { pattern = "file explorer",              icon = " ",  hl = "Directory" },
      { pattern = "treesitter",                 icon = " ",  color = "Green" },
      { pattern = "render markdown",            icon = " ",  color = "Purple" },
      { pattern = "trouble",                    icon = "󱜸 ",  color = "Yellow" },
      { pattern = "blame",                      icon = "󱜸 ",  color = "Red" },
      { pattern = "project",                    icon = "󰊢 ",  color = "Yellow" },
      { pattern = "no highlight search",        icon = "󰹏 ",  color = "Yellow" },
      { pattern = "format",                     icon = "󰁨  ", hl = "Type" },
      { pattern = "undo",                       icon = "󰕍 ",  hl = "Type" },
      -- { pattern = "quit",                    icon = "󰈆 ",  hl = "DevIconDefault" },
      { pattern = "rename",                     icon = "󰑕  ", hl = "Identifier" },
      { pattern = "increase indent",            icon = "󰔰 ",  hl = "Function" },
      { pattern = "decrease indent",            icon = "󰶢 ",  hl = "Function" },
      { pattern = "trim",                       icon = "󰁨 ",  color = "Red" },
      { pattern = "fix",                        icon = "󰁨 ",  color = "Cyan" },
      { pattern = "outline",                    icon = "󰊕 ",  hl = "Function" },
      { pattern = "maximize/minimize",          icon = "󰊓 ",  hl = "Function" },
      { pattern = "info",                       icon = " ",  hl = "Type" },
      { pattern = "action",                     icon = " ",  hl = "Function" },
      { pattern = "reset",                      icon = "󰑛 ",  hl = "Function" },
      { pattern = "symbol",                     icon = " ",  color = "Cyan" },
      { pattern = "preview",                    icon = " ",  hl = "Type" },
      { pattern = "window",                     icon = " ",  hl = "DevIconWindows" },
      { pattern = "help",                       icon = "󰘥 ",  hl = "DevIconDoc" },
      { pattern = "click",                      icon = " ",  hl = "Normal" },
      { pattern = "hover",                      icon = " ",  hl = "Normal" },
      { pattern = "prev",                       icon = "󰳡 ",  hl = "Type" },
      { pattern = "next",                       icon = "󰳛 ",  hl = "Type" },
      { pattern = "up",                         icon = "󰜷 ",  hl = "Type" },
      { pattern = "down",                       icon = "󰜮 ",  hl = "Type" },
      { pattern = "left",                       icon = "󰜱 ",  hl = "Type" },
      { pattern = "right",                      icon = "󰜴 ",  hl = "Type" },
      { pattern = "lsp",                        icon = " ",  hl = "Type" },
      { pattern = ".",  icon = "", hl = "Normal" },
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
    {"<leader><space>", "<cmd>StartScreen<CR>",         desc = "Start Screen",                  nowait = true, remap = false },
    { "<esc>",       "<cmd>nohls<CR>",                  desc = "No Highlight Search",           nowait = true, remap = false },
    { "<leader>w",   "<cmd>w!<CR>",                     desc = "Save",                          nowait = true, remap = false },
    { "<leader>d",   "<cmd>Bdelete!<CR>",               desc = "Close Buffer",                  nowait = true, remap = false },
    { "<leader>P",   find_projects,                     desc = "Selete Project",                nowait = true, remap = false },
    { "<leader>W",   "<cmd>Trim<CR>",                   desc = "Trim Trailing Whitespaces",     nowait = true, remap = false },
    { "<leader>-",   "<cmd>split<CR>",                  desc = "Split window —— ",              nowait = true, remap = false, icon = { icon = " ", hl = "VertSplit" }},
    { "<leader>|",   "<cmd>vsplit<CR>",                 desc = "Split window | Current Buffer", nowait = true, remap = false, icon = { icon = " ", hl = "VertSplit" }},
    { "<leader>V",   "<cmd>SplitStartScreen<CR>",       desc = "Split window | Start Screen",   nowait = true, remap = false, icon = { icon = " ", hl = "VertSplit" } },
    { "<leader>gU",  "<cmd>lua require('nvim-gitui').open_gitui()<cr>",  desc = "GitUI",                         nowait = true, remap = false },
    { "<leader>gB",  "<cmd>Telescope git_branches<cr>", desc = "Checkout branch",               nowait = true, remap = false },
    { "<leader>gc",  "<cmd>Telescope git_commits<cr>",  desc = "Checkout commit",               nowait = true, remap = false },
    { "<leader>go",  "<cmd>Telescope git_status<cr>",   desc = "Open changed file",             nowait = true, remap = false },
    { "<leader>SC",  "<cmd>Telescope commands<cr>",     desc = "Commands",                      nowait = true, remap = false },
    { "<leader>SM",  "<cmd>Telescope man_pages<cr>",    desc = "Man Pages",                     nowait = true, remap = false },
    { "<leader>SR",  "<cmd>Telescope registers<cr>",    desc = "Registers",                     nowait = true, remap = false },
    { "<leader>Sb",  "<cmd>Telescope git_branches<cr>", desc = "Checkout branch",               nowait = true, remap = false },
    { "<leader>Sc",  "<cmd>Telescope colorscheme<cr>",  desc = "Colorscheme",                   nowait = true, remap = false },
    { "<leader>Sh",  "<cmd>Telescope help_tags<cr>",    desc = "Find Help",                     nowait = true, remap = false },
    { "<leader>SH",  "<cmd>Telescope highlights<cr>",   desc = "Highlights",                    nowait = true, remap = false },
    { "<leader>Sk",  "<cmd>Telescope keymaps<cr>",      desc = "Keymaps",                       nowait = true, remap = false },
    { "<leader>Sr",  "<cmd>Telescope oldfiles<cr>",     desc = "Open Recent File",              nowait = true, remap = false },
    { "<leader>Tb",  "<cmd>TSBufToggle highlight<CR>",  desc = "TSBufToggle highlight",         nowait = true, remap = false },
    { "<leader>Tt",  "<cmd>TSToggle highlight<CR>",     desc = "TSToggle highlight",            nowait = true, remap = false },
    { "<leader>lM",  "<cmd>Mason<cr>",                  desc = "Mason Info",                    nowait = true, remap = false },
    { "<leader>lS",  workspace_symbols,                 desc = "Workspace Symbols",             nowait = true, remap = false },
    { "<leader>la",  vim.lsp.buf.code_action,           desc = "Code Action",                   nowait = true, remap = false },
    { "<leader>ld",  find_buf_diagnostics,              desc = "Diagnostics (Current Buf)",     nowait = true, remap = false },
    { "<leader>lw",  find_workspace_diagnostics,        desc = "Diagnostics (Workspace)",       nowait = true, remap = false },
    { "<leader>lf",  format,                            desc = "Format (conform)",              nowait = true, remap = false },
    { "<leader>lh",  toggle_inlay,                      desc = "Toggle Inlay Hint",             nowait = true, remap = false },
    { "<leader>lI",  "<cmd>LspInfo<cr>",                desc = "LSP Info",                      nowait = true, remap = false },
    { "<leader>lj",  vim.diagnostic.goto_next,          desc = "Next Diagnostic",               nowait = true, remap = false },
    { "<leader>lk",  vim.diagnostic.goto_prev,          desc = "Prev Diagnostic",               nowait = true, remap = false },
    { "<leader>ll",  vim.lsp.codelens.run,              desc = "CodeLens Action",               nowait = true, remap = false },
    { "<leader>lq",  vim.diagnostic.setloclist,         desc = "Quickfix",                      nowait = true, remap = false },
    { "<leader>lr",  vim.lsp.buf.rename,                desc = "Rename",                        nowait = true, remap = false },
    { "<leader>ls",  find_doc_symbols,                  desc = "Document Symbols",              nowait = true, remap = false },

    { "<leader>g",   group = "Git",        nowait = true, remap = false },
    { "<leader>S",   group = "Search",     nowait = true, remap = false },
    { "<leader>T",   group = "TreeSitter", nowait = true, remap = false },
    { "<leader>l",   group = "LSP",        nowait = true, remap = false },
    { "<leader>f",   group = "Telescope",  nowait = true, remap = false, icon = { icon = "󰭎 ", hl = "Directory" } },
    { "<leader>x",   group = "Trouble",    nowait = true, remap = false },
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
