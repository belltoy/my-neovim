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
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
    rules = {
      { pattern = "split window |", icon = " ", hl = "VertSplit" },
      { pattern = "trim", icon = "󰁨 ", color = "Red" },
      { pattern = "outline", icon = "󰊕 ", hl = "Function" },
      { pattern = "maximize/minimize a split", icon = " ", hl = "Function" },
      { pattern = "start screen", icon = "󰷜 ", hl = "Constant" },
      { pattern = "close buffer", icon = "󰅙 ", color = "Red" },
      { pattern = "save", icon = " ", color = "Blue" },
      { pattern = "treesitter", icon = " ", color = "Green" },
      { pattern = "trouble", icon = "󱜸 ", color = "Yellow" },
      { pattern = "project", icon = "󰊢 ", color = "Yellow" },
      { pattern = "git", icon = "󰊢 ", color = "Red" },
      -- { pattern = "toggle highlight search", icon = "󰹏 ", color = "Yellow" },
      { pattern = "toggle highlight search", icon = "  ", color = "Yellow" },
      { pattern = "format", icon = "󰁨  ", hl = "Type" },
      { pattern = "lsp", icon = " ", hl = "Type" },
      { pattern = "info", icon = " ", hl = "Type" },
      { pattern = "undo", icon = "󰕍 ", hl = "Type" },
      { pattern = "search", icon = "  ", hl = "Function" },
      -- { pattern = "quit", icon = "󰈆 ", hl = "DevIconDefault" },
      { pattern = "rename", icon = "󰑕  ", hl = "Identifier" },
      { pattern = "open url", icon = " ", hl = "DevIconHexadecimal" },
    },
  },
  sort = { "manual" },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = 'rounded', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true,
  triggers = 'auto', -- automatically setup triggers
  disable = {
    ---@type fun(ctx: { keys: string, mode: string, plugin?: string }):boolean?
    trigger = function(ctx)
      if ctx.mode == 'i' and (ctx.keys == '.' or ctx.keys == ",") then
        return true
      end
      return false
    end,
  },
  -- triggers_blacklist = {
  --   -- list of mode / prefixes that should never be hooked by WhichKey
  --   -- this is mostly relevant for key maps that start with a native binding
  --   -- most people should not need to change this
  --   i = { 'j', 'j' },
  --   v = { 'j', 'j' },
  -- },

  spec = {
    { "<leader><space>", "<cmd>StartScreen<CR>",                                                        desc = "Start Screen",                  nowait = true,   remap = false },
    {"<Leader>.",        "<cmd>lua vim.opt.hlsearch = not vim.opt.hlsearch:get()<CR>",                  desc = "Toggle Highlight Search",       nowait = true,   remap = false },
    { "<leader>w",       "<cmd>w!<CR>",                                                                 desc = "Save",                          nowait = true,   remap = false },
    { "<leader>d",       "<cmd>Bdelete!<CR>",                                                           desc = "Close Buffer",                  nowait = true,   remap = false },

    { "<leader>P",       "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>",              desc = "Selete Project",                nowait = true,   remap = false },
    { "<leader>W",       "<cmd>Trim<CR>",                                                               desc = "Trim Trailing Spaces",          nowait = true,   remap = false },
    { "<leader>b",       "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                desc = "Git Blame Current Line",        nowait = true,   remap = false },
    { "<leader>g",       group = "Git",                                                                 nowait = true,                          remap = false },
    { "<leader>gB",      "<cmd>Telescope git_branches<cr>",                                             desc = "Checkout branch",               nowait = true,   remap = false },
    { "<leader>gR",      "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                              desc = "Reset Buffer",                  nowait = true,   remap = false },
    { "<leader>gb",      "<cmd>Git blame<CR>",                                                          desc = "Git Blame",                     nowait = true,   remap = false },
    { "<leader>gc",      "<cmd>Telescope git_commits<cr>",                                              desc = "Checkout commit",               nowait = true,   remap = false },
    { "<leader>gd",      "<cmd>Gitsigns diffthis HEAD<cr>",                                             desc = "Diff",                          nowait = true,   remap = false },
    { "<leader>gg",      "<cmd>lua _LAZYGIT_TOGGLE()<CR>",                                              desc = "Lazygit",                       nowait = true,   remap = false },
    { "<leader>gh",      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                              desc = "Preview Hunk",                  nowait = true,   remap = false },
    { "<leader>gj",      "<cmd>lua require 'gitsigns'.next_hunk()<cr>",                                 desc = "Next Hunk",                     nowait = true,   remap = false },
    { "<leader>gk",      "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",                                 desc = "Prev Hunk",                     nowait = true,   remap = false },
    { "<leader>gl",      "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                desc = "Blame Whole File",              nowait = true,   remap = false },
    { "<leader>go",      "<cmd>Telescope git_status<cr>",                                               desc = "Open changed file",             nowait = true,   remap = false },
    { "<leader>gp",      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                              desc = "Preview Hunk",                  nowait = true,   remap = false },
    { "<leader>gr",      "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                                desc = "Reset Hunk",                    nowait = true,   remap = false },
    { "<leader>gs",      "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                                desc = "Stage Hunk",                    nowait = true,   remap = false },
    { "<leader>gu",      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                           desc = "Undo Stage Hunk",               nowait = true,   remap = false },

    { "<leader>s",       "<cmd>split<CR>",                                                              desc = "Split window —— ",              nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" }},
    { "<leader>-",       "<cmd>split<CR>",                                                              desc = "Split window —— ",              nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" }},
    { "<leader>v",       "<cmd>vsplit<CR>",                                                             desc = "Split window | Current Buffer", nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" }},
    { "<leader>|",       "<cmd>vsplit<CR>",                                                             desc = "Split window | Current Buffer", nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" }},
    { "<leader>V",       "<cmd>SplitStartScreen<CR>",                                                   desc = "Split window | Start Screen",   nowait = true,   remap = false,   icon = {icon = " ", hl = "VertSplit" } },
    { "<leader>u",       "<cmd>UrlView<CR>",                                                            desc = "Open URL",                      nowait = true,   remap = false },
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
    { "<leader>lI",      "<cmd>Mason<cr>",                                                              desc = "Installer Info",                nowait = true,   remap = false },
    { "<leader>lS",      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                            desc = "Workspace Symbols",             nowait = true,   remap = false },
    { "<leader>la",      "<cmd>lua vim.lsp.buf.code_action()<cr>",                                      desc = "Code Action",                   nowait = true,   remap = false },
    { "<leader>ld",      "<cmd>Telescope diagnostics bufnr=0<cr>",                                      desc = "Diagnostics (Current Buffer)",  nowait = true,   remap = false },
    { "<leader>lf",      "<cmd>lua vim.lsp.buf.format { async = true }<cr>",                            desc = "Format (conform)",              nowait = true,   remap = false },
    { "<leader>lh",      "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", desc = "Toggle Inlay Hint",             nowait = true,   remap = false },
    { "<leader>li",      "<cmd>LspInfo<cr>",                                                            desc = "Info",                          nowait = true,   remap = false },
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

local km_opts = {
  mode = 'n', -- NORMAL mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#A16600" })
-- vim.cmd [[ hi WhichKeyBorder guifg=#A16600 ]]

return {
  'folke/which-key.nvim',

  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  opts = opts,
  -- config = function()
  --   local which_key = require('which-key')
  --   which_key.setup(setup)
  --   -- which_key.register(mappings, opts)
  -- end
}
