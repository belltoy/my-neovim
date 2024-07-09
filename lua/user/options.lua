local options = {
  backup = false,                            -- creates a backup file
  clipboard = 'unnamedplus',                 -- allows neovim to access the system clipboard
  cmdheight = 1,                             -- more space in the neovim command line for displaying messages
  completeopt = { 'menuone', 'noselect' },   -- mostly just for cmp
  conceallevel = 0,                          -- so that `` is visible in markdown files
  fileencoding = 'utf-8',                    -- the encoding written to a file
  hlsearch = true,                           -- highlight all matches on previous search pattern
  ignorecase = true,                         -- ignore case in search patterns
  mouse = 'a',                               -- allow the mouse to be used in neovim
  pumheight = 10,                            -- pop up menu height
  showmode = false,                          -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                           -- always show tabs
  smartcase = true,                          -- smart case
  smartindent = true,                        -- make indenting smarter again
  splitbelow = true,                         -- force all horizontal splits to go below current window
  splitright = true,                         -- force all vertical splits to go to the right of current window
  swapfile = false,                          -- creates a swapfile
  termguicolors = true,                      -- set term gui colors (most terminals support this)
  timeoutlen = 100,                          -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                           -- enable persistent undo
  updatetime = 300,                          -- faster completion (4000ms default)
  writebackup = false,                       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                          -- convert tabs to spaces
  shiftwidth = 4,                            -- the number of spaces inserted for each indentation
  tabstop = 4,                               -- insert 2 spaces for a tab
  softtabstop = 4,
  cursorline = true,                         -- highlight the current line
  number = true,                             -- set numbered lines
  relativenumber = false,                    -- set relative numbered lines
  numberwidth = 4,                           -- set number column width to 2 {default 4}
  signcolumn = 'yes',                        -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                              -- display lines as one long line
  scrolloff = 0,                             -- is one of my fav
  sidescrolloff = 8,
  -- guifont = 'DejaVuSansMono Nerd Font:h13',  -- the font used in graphical neovim applications
  guifont = 'DejaVuSansM Nerd Font Mono:h13',  -- the font used in graphical neovim applications
  mousemoveevent = true,
}

vim.opt.shortmess:append('c')

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd([[set iskeyword+=-]])
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd([[set colorcolumn=100]])

vim.g.copilot_node_command = '~/.nvm/versions/node/v17.8.0/bin/node'

if vim.g.neovide then
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

  local keymap = vim.api.nvim_set_keymap
  keymap('n', '<M-f>', '<cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<cr>', { noremap = true, silent = true })
end

vim.g.vim_markdown_folding_disabled = 1

vim.g.extra_whitespace_ignored_filetypes = {
    'NvimTree', 'alpha', 'dashboard', 'TelescopePrompt', 'lspinfo',
    'Trouble', 'aerial', 'lsp-installer', 'help',
}
vim.g.tmux_navigator_disable_when_zoomed = 0

-- Neovide
vim.cmd([[
au BufRead,BufNewFile *.edc setlocal filetype=edc
au BufRead,BufNewFile *.kdl setlocal filetype=kdl
au BufRead,BufNewFile *.qml setlocal filetype=qml
au BufReadPost *.rs setlocal filetype=rust

au BufRead,BufNewFile *.log{.\d}\\\{0,\} setlocal ft=log
au BufRead,BufNewFile *.tmux.conf setlocal ft=tmux
au BufRead,BufNewFile *.conf setlocal ft=dosini

au BufRead,BufNewFile *.eco setlocal filetype=html

let g:vim_markdown_fenced_languages = [ 'sh=bash', 'erlang-repl=erlang', 'ini=dosini' ]
let g:markdown_fenced_languages = [ 'sh=bash', 'erlang-repl=erlang', 'ini=dosini' ]
]])

