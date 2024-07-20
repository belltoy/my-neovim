-- https://github.com/numToStr/Comment.nvim/issues/167
-- https://github.com/folke/which-key.nvim/issues/218
return {
  'numToStr/Comment.nvim', -- Easily comment stuff
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        highlight = {
          comments_only = false, -- uses treesitter to match keywords in comments only
        },
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
      })

      require('Comment').setup({

        pre_hook = function(ctx)
          local U = require('Comment.utils')

          local location = nil
          if ctx.ctype == U.ctype.blockwise then
            location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
          end

          return require('ts_context_commentstring.internal').calculate_commentstring({
            key = ctx.ctype == U.ctype.linewise and '__default' or '__multiline',
            location = location,
          })
        end,

        opleader = {
          -- line = 'gc',
          -- block = 'gb',
        },

        ---LHS of toggle mappings in NORMAL + VISUAL mode
        ---@type table
        toggler = {
          ---Line-comment toggle keymap
          line = 'gcc',
          ---Block-comment toggle keymap
          block = 'gbc',
        },
      })

      local ft = require('Comment.ft')
      ft.json5 = '//%s'
    end,
  }
}
