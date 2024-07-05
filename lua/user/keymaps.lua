local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

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

-- Navigate tabs
keymap("n", "<M-1>", "gT", opts)
keymap("n", "<M-2>", "gt", opts)

-- Navigate buffers
-- keymap("n", "<M-1>", ":bprevious<CR>", opts)
-- keymap("n", "<M-2>", ":bnext<CR>", opts)
keymap("n", "<M-h>", ":bprevious<CR>", opts)
keymap("n", "<M-l>", ":bnext<CR>", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<A->>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<A-lt>", ":vertical resize +2<CR>", opts)
-- Use smart-splits instead

-- Illuminate
-- You can cycle through these document highlights with these mappings:
keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)

-- split buffers
-- keymap("n", "<Leader>v", ":vsplit<CR>", opts)
-- keymap("n", "<Leader>s", ":split<CR>", opts)

-- EasyAlign
keymap("v", "<Enter>", "<Plug>(EasyAlign)", opts)
keymap("n", "<Leader>aa", "<Plug>(EasyAlign)", opts)
vim.cmd([[
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
]])

-- Telescope
-- keymap("n", "<Leader>f", "<cmd>Telescope find_files<CR>", opts)
-- keymap("n", "<Leader>r", "<cmd>Telescope live_grep<CR>", opts)
-- keymap("n", "<Leader>F", "<cmd>Telescope live_grep<CR>", opts)
-- keymap("n", "<Leader>b", "<cmd>Telescope buffers<CR>", opts)
-- keymap("n", "<Leader>gb", "<cmd>Git blame<CR>", opts)
-- keymap("n", "<Leader>fb", "<cmd>Telescope help_tags", opts)
-- keymap("n", "<Leader><space>", "<cmd>Startify<CR>", opts)

keymap("n", "<Leader>n", "<cmd>NvimTreeToggle<CR>", opts)

-- GUI Tools integration
keymap("n", "<Leader>tw", "<cmd>!tower .<CR><CR>", opts)

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

-- Range Format
-- keymap("v", "F", ":lua vim.lsp.buf.formatexpr()<CR>", opts)
keymap("v", "F", "<ESC><cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
-- vim.keymap.set('n', 'F', function() vim.lsp.buf.format { async = true } end, {noremap = true, silent = true})
-- keymap("v", "F", ":lua vim.lsp.buf.code_action({range = vim.lsp.util.compute_range()})<CR>", opts)
-- keymap("v", "gf", ":lua vim.lsp.buf.format()<CR>", {buffer = true})

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Copy Paste --
-- system clipboard
-- vim.cmd([[
--     nmap <c-c> "+y
--     vmap <c-c> "+y
--     nmap <c-v> "+p
--     inoremap <c-v> <c-r>+
--     cnoremap <c-v> <c-r>+
--     " use <c-r> to insert original character without triggering things like auto-pairs
--     inoremap <c-r> <c-v>
-- ]])
-- keymap("n", "<C-c>", '"+y', opts)
-- keymap("v", "<C-c>", '"+y', opts)
-- keymap("n", "<C-v>", '"+p', opts)
-- keymap("i", "<C-v>", '<C-r>+', opts)
-- keymap("c", "<C-v>", '<C-r>+', opts)
-- keymap("i", "<C-r>", '<C-v>', opts)

-- <D-v> on Mac means Cmd+v
keymap("i", "<D-v>", '<C-r>+', opts)
keymap("v", "<D-c>", '"+y', opts)

-- -- Terminal --
-- -- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
