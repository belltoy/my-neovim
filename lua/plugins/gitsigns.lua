local opts = {
  signs = {
    add          = { text = '┃' },
    untracked    = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '┃' },
    topdelete    = { text = '‾' },
    changedelete = { text = '┃' },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },

  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>b', gitsigns.blame_line, { desc = 'Blame current line' })
    map('n', '<leader>gl', gitsigns.blame_line, { desc = 'Blame current line' })
    map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
    map('n', '<leader>gb', gitsigns.blame, { desc = 'Git Blame' })
    map('n', '<leader>gd', function() gitsigns.diffthis('~') end, { desc = 'Diff' })
    map('n', '<leader>gh', gitsigns.preview_hunk, { desc = 'Preview hunk' })
    map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
    map('n', '<leader>gj', function() gitsigns.nav_hunk('next') end, { desc = 'Next hunk' })
    map('n', '<leader>gk', function() gitsigns.nav_hunk('prev') end, { desc = 'Previous hunk' })
    map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
    map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
    map('n', '<leader>gS', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
    map('n', ']h', gitsigns.next_hunk, { desc = 'Next hunk' })
    map('n', '[h', gitsigns.prev_hunk, { desc = 'Previous hunk' })

  end
}

return {
  'lewis6991/gitsigns.nvim',
  opts = opts,
}
