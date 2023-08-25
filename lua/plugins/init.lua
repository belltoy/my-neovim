return {
    -- My plugins here
    -- 'wbthomason/packer.nvim', -- Have packer manage itself
    'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
    'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
    'nvim-tree/nvim-web-devicons',

    'moll/vim-bbye',

    -- Speed up loading Lua modules in Neovim to improve startup time.
    -- As of Neovim 0.9, this plugin is no longer required. Instead run:
    -- vim.loader.enable()
    --'lewis6991/impatient.nvim',

    'lukas-reineke/indent-blankline.nvim',
    'antoinemadec/FixCursorHold.nvim', -- This is needed to fix lsp doc highlight

    -- Start screen
    -- "goolord/alpha-nvim",
    -- 'mhinz/vim-startify',
    -- "glepnir/dashboard-nvim",

    'godlygeek/tabular',

    'preservim/vim-markdown',

    -- vim-polyglot
    -- A sold language pack for vim
    -- Including ftdetect, indent, syntax, and plugins for many languages
    -- Maybe conflict with nvim-treesitter
    'sheerun/vim-polyglot',

    'github/copilot.vim',
    'junegunn/vim-easy-align',

    -- tmux integration
    'tmux-plugins/vim-tmux',
    'christoomey/vim-tmux-navigator',
    -- "edkolev/tmuxline.vim",

    -- Colorschemes
    -- "lunarvim/colorschemes", -- A bunch of colorschemes you can try out
    'lunarvim/darkplus.nvim',
    { 'folke/tokyonight.nvim', commit = '8223c970677e4d88c9b6b6d81bda23daf11062bb' },
    'tomasr/molokai',

    -- Conflict with Copilot, disable for now
    -- cmp plugins
    -- "hrsh7th/nvim-cmp",         -- The completion plugin
    -- "hrsh7th/cmp-buffer",       -- buffer completions
    -- "hrsh7th/cmp-path",         -- path completions
    -- "hrsh7th/cmp-cmdline",      -- cmdline completions
    -- "saadparwaiz1/cmp_luasnip", -- snippet completions
    -- "uga-rosa/cmp-dictionary",  -- dictionary completions
    -- "hrsh7th/cmp-nvim-lsp",
    -- "dmitmel/cmp-cmdline-history",

    -- snippets
    'L3MON4D3/LuaSnip', --snippet engine
    'rafamadriz/friendly-snippets', -- a bunch of snippets to use

    -- LSP
    'neovim/nvim-lspconfig', -- enable LSP
    'williamboman/mason.nvim', -- simple to use language server installer, replaced williamboman/nvim-lsp-installer
    'williamboman/mason-lspconfig.nvim',
    -- 'tamago324/nlsp-settings.nvim', -- language server settings defined in json for
    'jose-elias-alvarez/null-ls.nvim', -- for formatters and linters
    -- Vim plugin for automatically highlighting other uses of the word under the cursor.
    -- Integrates with Neovim's LSP client for intelligent highlighting.
    'RRethy/vim-illuminate',

    'ckipp01/stylua-nvim',
    'gpanders/editorconfig.nvim',

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'BurntSushi/ripgrep',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    -- use matchup for now
    -- "theHamsta/nvim-treesitter-pairs",
    'JoosepAlviste/nvim-ts-context-commentstring',

    -- Smooth scrolling
    -- {'declancm/cinnamon.nvim',
    --     config = function()
    --         require('cinnamon').setup({})
    --     end
    -- },
    -- {'karb94/neoscroll.nvim',
    --     config = function()
    --         require('neoscroll').setup({
    --             easing_function = 'sine',
    --         })
    --     end
    -- },

    -- Smooth escaping
    'max397574/better-escape.nvim',

    -- Url viewer
    'axieax/urlview.nvim',

    'rainbowhxch/accelerated-jk.nvim',

    {
        'ruifm/gitlinker.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    -- agitator is a neovim/lua plugin providing some git-related functions
    {
        'emmanueltouzery/agitator.nvim',
        config = function()
            require('agitator')
        end,
    },

    -- airline need fugitive
    'tpope/vim-fugitive',
    'shumphrey/fugitive-gitlab.vim',

    -- 'nvim-lualine/lualine.nvim',
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',

    {
        'tiagovla/scope.nvim',
        config = function()
            require('scope').setup()
        end,
    },

    -- 'rcarriga/nvim-notify',

    'norcalli/nvim-colorizer.lua',

    'andymass/vim-matchup',

    'segeljakt/vim-silicon', -- Generate a image of selected source codes

    'wakatime/vim-wakatime',

    'bronson/vim-trailing-whitespace',

    -- 'nvim-telescope/telescope-ui-select.nvim',

    'brymer-meneses/grammar-guard.nvim',

    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('trouble').setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },

    -- Scala
    {'scalameta/nvim-metals', dependencies = { "nvim-lua/plenary.nvim" }},

    -- "Pocco81/TrueZen.nvim",
    'folke/twilight.nvim',

    -- Standalone UI for nvim-lsp progress
    {
        'j-hui/fidget.nvim',
        tag = "legacy",
        event = "LspAttach",
        opts = {
          -- options
        },
    },
    'ron-rs/ron.vim',
    'folke/zen-mode.nvim',
    -- 'nicwest/vim-http',
    'skreuzer/vim-prometheus',

    -- "alexghergh/nvim-tmux-navigation",

    -- Debugging
    {
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = { 'BufRead Cargo.toml' },
        config = function()
            require('crates').setup()
        end,
    },
    -- "mfussenegger/nvim-dap",

    'mrjones2014/smart-splits.nvim',

    'gleam-lang/gleam.vim',

    'belltoy/prom.vim',

    'kylechui/nvim-surround',
}
