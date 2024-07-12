local options = {
  backup = false,                          -- creates a backup file
  clipboard = 'unnamedplus',               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = 'utf-8',                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = 'a',                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  softtabstop = 4,
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = 'yes',                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 0,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = 'DejaVuSansM Nerd Font:h13', -- the font used in graphical neovim applications
  mousemoveevent = true,
}

vim.opt.shortmess:append('c')

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.opt.iskeyword:append('-')
-- vim.cmd([[set iskeyword+=-]])
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.o.colorcolumn = '100'

vim.g.copilot_node_command = '~/.nvm/versions/node/v17.8.0/bin/node'

if vim.g.neovide then
  -- let g:neovide_padding_top = 30
  vim.g.neovide_padding_top = 0
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_remember_window_position = true
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_window_blurred = true
  vim.g.neovide_fullscreen = true
  -- vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_hide_mouse_when_typing = true
  -- macOS meta key
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

  -- Set terminal colors for neovide, keep the same as the alacritty colors
  vim.g.terminal_color_0 = '#333333'
  vim.g.terminal_color_1 = '#C4265E'
  vim.g.terminal_color_2 = '#86B42B'
  vim.g.terminal_color_3 = '#B3B42B'
  vim.g.terminal_color_4 = '#7065ff'
  vim.g.terminal_color_5 = '#8C6BC8'
  vim.g.terminal_color_6 = '#56ADBC'
  vim.g.terminal_color_7 = '#c4c5b5'

  vim.g.terminal_color_8  = '#666666'
  vim.g.terminal_color_9  = '#F92672'
  vim.g.terminal_color_10 = '#A6E22E'
  vim.g.terminal_color_11 = '#E2E22E'
  vim.g.terminal_color_12 = '#819AFF'
  vim.g.terminal_color_13 = '#AE81FF'
  vim.g.terminal_color_14 = '#66D9EF'
  vim.g.terminal_color_15 = '#F8F8F2'

  local keymap = vim.api.nvim_set_keymap
  keymap('n', '<M-f>', '<cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<cr>',
    { noremap = true, silent = true })

  local autocmd = vim.api.nvim_create_autocmd

  autocmd({'BufRead', 'BufNewFile'}, { pattern = '*.edc', command = 'setlocal filetype=edc', })
  autocmd({'BufRead', 'BufNewFile'}, { pattern = '*.kdl', command = 'setlocal filetype=kdl', })
  autocmd({'BufRead', 'BufNewFile'}, { pattern = '*.qml', command = 'setlocal filetype=qml', })
  autocmd({'BufRead', 'BufNewFile'}, { pattern = '*.eco', command = 'setlocal filetype=html', })
  autocmd({'BufRead', 'BufNewFile'}, { pattern = "*.log{.\\d}\\{0,\\}", command = 'setlocal filetype=log', })
  vim.g.vim_markdown_fenced_languages = { 'sh=bash', 'erlang-repl=erlang', 'ini=dosini' }
  vim.g.markdown_fenced_languages = { 'sh=bash', 'erlang-repl=erlang', 'ini=dosini' }
end

vim.g.vim_markdown_folding_disabled = 1

vim.g.extra_whitespace_ignored_filetypes = {
  'NvimTree', 'alpha', 'dashboard', 'TelescopePrompt', 'lspinfo',
  'Trouble', 'aerial', 'lsp-installer', 'help',
}
vim.g.tmux_navigator_disable_when_zoomed = 0
