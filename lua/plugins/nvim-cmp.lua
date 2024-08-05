local opts = function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  return {
    preselect = cmp.PreselectMode.Item,
    formatting = {
      expandable_indicator = false,
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        ellipsis_char = '...',
        maxwidth = 50,
        show_labelDetails = true,
      }),
    },

    view = {
      docs = {
        auto_open = false
      },
    },

    completion = {
      -- manually invoke completion
      autocomplete = false,
      completeopt = "menu,menuone,noselect",
    },

    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-l>'] = cmp.mapping.complete(),
      ['<C-k>'] = function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end,
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    }),
  }
end

return {
  {
    'L3MON4D3/LuaSnip', --snippet engine
    version = "v2.*",
    build = "make install_jsregexp",
  },
  {
    'saadparwaiz1/cmp_luasnip', -- snippet source for nvim-cmp
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
  },

  {
    'hrsh7th/nvim-cmp',

    depdendencies = {
      'neovim/nvim-lspconfig',
      'L3MON4D3/LuaSnip', --snippet engine

      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
    },

    config = function()
      local cmp = require('cmp')

      cmp.setup(opts())

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        preselect = cmp.PreselectMode.Item,
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        -- preselect = cmp.PreselectMode.None,
        preselect = cmp.PreselectMode.Item,
        mapping = cmp.mapping.preset.cmdline({
          ["<CR>"] = cmp.mapping({
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          })
        }),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        completion = {
          -- manually invoke completion
          completeopt = "menu",
        },
        matching = { disallow_symbol_nonprefix_matching = false }
      })

    end
  },
}
