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

        ---LHS of toggle mappings in NORMAL + VISUAL mode
        ---@type table
        toggler = {
            ---Line-comment toggle keymap
            line = 'gcc',
            ---Block-comment toggle keymap
            block = 'gbc',
        },
      })

      ft = require('Comment.ft')
      ft.json5 = '//%s'
    end,
  }
}
