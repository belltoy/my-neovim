local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)

-- split buffers
keymap("n", "<Leader>h", ":vsplit<CR>", opts)
keymap("n", "<Leader>v", ":split<CR>", opts)

-- EasyAlign
keymap("v", "<Enter>", "<Plug>(EasyAlign)", opts)
keymap("n", "<Leader><space>a", "<Plug>(EasyAlign)", opts)

-- Telescope
keymap("n", "<Leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<Leader>r", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<Leader>F", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<Leader>u", "<cmd>Telescope urlview<CR>", opts)
keymap("n", "<Leader>b", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<Leader>gb", "<cmd>Git blame<CR>", opts)
-- keymap("n", "<Leader>fb", "<cmd>Telescope help_tags", opts)
keymap("n", "<Leader>s", "<cmd>Startify<CR>", opts)

keymap("n", "<Leader>n", "<cmd>NvimTreeToggle<CR>", opts)

-- GUI Tools integration
keymap("n", "<Leader>tw", "<cmd>!tower .<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Only current buffer
keymap("n", "<Leader>on", ":only<CR>", opts)

-- Insert --
-- Press jj fast to enter
-- timeout in 300ms
vim.opt.timeoutlen = 300
keymap("i", "jj", "<ESC>", opts)
keymap("i", "uu", "_", opts)
keymap("i", "..", "->", opts)
keymap("i", ",,", "<-", opts)
keymap("i", "hh", "=>", opts)
keymap("i", "aa", "@", opts)
keymap("i", "<up>", "<C-o>gk", opts)
keymap("i", "<down>", "<C-o>gj", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", ">", "v><Esc>", opts)
keymap("n", "<", "v<<Esc>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

keymap("v", "/", "y/<C-R>\"<CR>", opts)
keymap("v", "?", "y?<C-R>\"<CR>", opts)
-- turn off highlight search
keymap("n", "<Leader>.", ":nohlsearch<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

