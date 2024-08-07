return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    -- https://github.com/luukvbaal/statuscol.nvim/issues/74
    vim.opt.foldcolumn = "0"
    vim.opt.fillchars:append {
      -- stl = '─',
      -- stlnc = '─',
      fold = ' ',
      foldopen = '',
      foldsep = ' ',
      foldclose = '',
      -- vert = '│',
    }
    require("statuscol").setup({
      segments = {
        {
          sign = { namespace = { "diagnostic" }, name = { ".*" }, maxwidth = 1, auto = true },
          click = "v:lua.ScSa"
        },

        -- TODO sign will show via diagnostic
        -- {
        --   sign = { namespace = { "todo-signs" }, name = { ".*" }, maxwidth = 2, auto = true },
        --   click = "v:lua.ScSa"
        -- },

        { text = { builtin.lnumfunc }, click = "v:lua.ScLa", auto = false },

        -- Fold column
        {
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
          auto = false, maxwidth = 1, colwidth = 1,
        },

        {
          sign = {
            namespace = { "gitsigns" },
            maxwidth = 1, colwidth = 1, auto = false, wrap = true,
          },
          click = "v:lua.ScSa"
        },
      },

      -- -- Default segments (fold -> sign -> line number + separator)
      -- segments = {
      --   { text = { "%C" }, click = "v:lua.ScFa" },
      --   { text = { "%s" }, click = "v:lua.ScSa" },
      --   {
      --     text = { builtin.lnumfunc, " " },
      --     condition = { true, builtin.not_empty },
      --     click = "v:lua.ScLa",
      --   },
      -- },
    })
  end,
}
