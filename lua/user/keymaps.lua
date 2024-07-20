-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

local desc = function(table, value)
  local tbl = {}
  for k, v in pairs(table) do
    tbl[k] = v
  end
  tbl["desc"] = value
  return tbl
end

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate tabs
keymap("n", "<M-1>", ":tabprevious<CR>", opts)
keymap("n", "<M-2>", ":tabnext<CR>", opts)

-- Navigate buffers
keymap("n", "<M-h>", ":bprevious<CR>", opts)
keymap("n", "<M-l>", ":bnext<CR>", opts)

-- Illuminate
-- You can cycle through these document highlights with these mappings:
keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap('n', '<c-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)
keymap('n', '<c-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)

-- EasyAlign
keymap("v", "<Enter>", "<Plug>(EasyAlign)", opts)
-- keymap("n", "<Leader>aa", "<Plug>(EasyAlign)", opts)
vim.cmd([[
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
]])

keymap("n", "<Leader>n", "<cmd>Neotree toggle<CR>", desc(opts, "File Explorer"))

-- GUI Tools integration
keymap("n", "<Leader>gt", "<cmd>!tower .<CR><CR>", desc(opts, "Git Tower"))

-- Only current buffer
-- keymap("n", "<Leader>O", ":only<CR>", desc(opts, "Only Current Buffer"))

-- Insert --
-- Press jj fast to escape insert mode
-- timeout in 300ms
vim.opt.timeoutlen = 300
keymap("i", "jj", "<ESC>", opts)
keymap("i", "uu", "_", opts)
keymap("i", "..", "->", opts)
keymap("i", ",,", "<-", opts)
keymap("i", "hh", "=>", opts)
keymap("i", "aa", "@", opts)
-- keymap("i", "<up>", "<C-o>gk", opts)
-- keymap("i", "<down>", "<C-o>gj", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", ">", "v><Esc>", desc(opts, "Increase Indent"))
keymap("n", "<", "v<<Esc>", desc(opts, "Decrease Indent"))

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==<Esc>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==<Esc>", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

keymap("v", "/", "y/<C-R>\"<CR>", opts)
keymap("v", "?", "y?<C-R>\"<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("i", "<D-v>", '<C-r>+', opts)
keymap("v", "<D-c>", '"+y', opts)

keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
