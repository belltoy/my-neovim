local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    print('Installing packer close and reopen Neovim...')
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
  set conceallevel=3
]])

-- vim.cmd [[
--   augroup illuminate_augroup
--     autocmd!
--     autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
--   augroup END
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
    max_jobs = 50,
})

-- vim.g.vim_markdown_folding_disabled = 1
-- vim.cmd[[
-- let g:vim_markdown_fenced_languages = [ 'sh=bash' ]
-- ]]
-- vim.cmd [[
-- let g:markdown_fenced_languages = [ 'bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css', 'rust', 'sql']
-- let g:vim_markdown_fenced_languages = [ 'sh=bash', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css', 'rust', 'sql']
-- ]]
-- vim.g.startify_change_to_dir = 0
vim.g.webdevicons_enable_airline_tabline = 1
vim.g.webdevicons_enable_airline_statusline = 1
vim.g.airline_powerline_fonts = 1
vim.cmd [[
let g:airline#extensions#tabline#enabled = 1
]]
vim.g.Illuminate_ftblacklist = { 'nerdtree', 'NvimTree' }

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use('wbthomason/packer.nvim') -- Have packer manage itself
    use('nvim-lua/popup.nvim') -- An implementation of the Popup API from vim in Neovim
    use('nvim-lua/plenary.nvim') -- Useful lua functions used ny lots of plugins
    use('windwp/nvim-autopairs') -- Autopairs, integrates with both cmp and treesitter
    use('numToStr/Comment.nvim') -- Easily comment stuff
    use('kyazdani42/nvim-web-devicons')
    use('kyazdani42/nvim-tree.lua')
    use('akinsho/bufferline.nvim')
    use('moll/vim-bbye')
    use('akinsho/toggleterm.nvim')
    use('ahmedkhalf/project.nvim')
    use('lewis6991/impatient.nvim')
    use('lukas-reineke/indent-blankline.nvim')
    use('antoinemadec/FixCursorHold.nvim') -- This is needed to fix lsp doc highlight
    use('folke/which-key.nvim')

    -- Start screen
    -- use "goolord/alpha-nvim"
    use('mhinz/vim-startify')
    -- use "glepnir/dashboard-nvim"

    use('godlygeek/tabular')

    use('simrat39/rust-tools.nvim')
    use('rust-lang/rust.vim')
    use('preservim/vim-markdown')

    -- Maybe conflict with nvim-treesitter
    use('sheerun/vim-polyglot')

    use('github/copilot.vim')
    use('junegunn/vim-easy-align')

    -- tmux integration
    use('tmux-plugins/vim-tmux')
    use('christoomey/vim-tmux-navigator')
    -- use "edkolev/tmuxline.vim"

    -- Colorschemes
    -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use('lunarvim/darkplus.nvim')
    use({ 'folke/tokyonight.nvim', commit = '8223c970677e4d88c9b6b6d81bda23daf11062bb' })
    use('tomasr/molokai')
    use('xiyaowong/nvim-transparent')

    -- Conflict with Copilot, disable for now
    -- cmp plugins
    -- use "hrsh7th/nvim-cmp" -- The completion plugin
    -- use "hrsh7th/cmp-buffer" -- buffer completions
    -- use "hrsh7th/cmp-path" -- path completions
    -- use "hrsh7th/cmp-cmdline" -- cmdline completions
    -- use "saadparwaiz1/cmp_luasnip" -- snippet completions
    -- use "uga-rosa/cmp-dictionary" -- dictionary completions
    -- use "hrsh7th/cmp-nvim-lsp"
    -- use "dmitmel/cmp-cmdline-history"

    -- snippets
    use('L3MON4D3/LuaSnip') --snippet engine
    use('rafamadriz/friendly-snippets') -- a bunch of snippets to use

    -- LSP
    use('neovim/nvim-lspconfig') -- enable LSP
    use('williamboman/nvim-lsp-installer') -- simple to use language server installer
    use('tamago324/nlsp-settings.nvim') -- language server settings defined in json for
    use('jose-elias-alvarez/null-ls.nvim') -- for formatters and linters
    -- Vim plugin for automatically highlighting other uses of the word under the cursor.
    -- Integrates with Neovim's LSP client for intelligent highlighting.
    use('RRethy/vim-illuminate')

    use('ckipp01/stylua-nvim')
    use('gpanders/editorconfig.nvim')

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
    })
    use('BurntSushi/ripgrep')
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use('nathom/filetype.nvim')

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    })
    use('nvim-treesitter/nvim-treesitter-textobjects')
    use('nvim-treesitter/playground')
    -- use matchup for now
    -- use "theHamsta/nvim-treesitter-pairs"
    use('JoosepAlviste/nvim-ts-context-commentstring')
    use('p00f/nvim-ts-rainbow')

    -- Smooth scrolling
    -- use({'declancm/cinnamon.nvim',
    --     config = function()
    --         require('cinnamon').setup({})
    --     end
    -- })
    -- use({'karb94/neoscroll.nvim',
    --     config = function()
    --         require('neoscroll').setup({
    --             easing_function = 'sine',
    --         })
    --     end
    -- })

    -- Smooth escaping
    use('max397574/better-escape.nvim')

    -- Url viewer
    use('axieax/urlview.nvim')

    use('rainbowhxch/accelerated-jk.nvim')

    -- Git
    use('lewis6991/gitsigns.nvim')
    use({
        'ruifm/gitlinker.nvim',
        requires = 'nvim-lua/plenary.nvim',
    })
    use({
        'emmanueltouzery/agitator.nvim',
        config = function()
            require('agitator')
        end,
    })

    -- airline need fugitive
    use 'tpope/vim-fugitive'
    use 'shumphrey/fugitive-gitlab.vim'

    -- use('nvim-lualine/lualine.nvim')
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use({
        'tiagovla/scope.nvim',
        config = function()
            require('scope').setup()
        end,
    })

    -- use('rcarriga/nvim-notify')

    use({
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    use('stevearc/aerial.nvim')

    use('norcalli/nvim-colorizer.lua')

    use('andymass/vim-matchup')

    use('segeljakt/vim-silicon') -- Generate a image of selected source codes

    use('wakatime/vim-wakatime')

    use('bronson/vim-trailing-whitespace')

    use('nvim-telescope/telescope-ui-select.nvim')

    use('brymer-meneses/grammar-guard.nvim')

    use({
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('trouble').setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    -- Scala
    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

    -- use "Pocco81/TrueZen.nvim"
    use 'folke/twilight.nvim'

    use({
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup({}) end
    })
    use 'ron-rs/ron.vim'
    use 'folke/zen-mode.nvim'
    -- use 'nicwest/vim-http'
    use 'skreuzer/vim-prometheus'

    -- use "alexghergh/nvim-tmux-navigation"

    -- Debugging
    use({
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        requires = { 'nvim-lua/plenary.nvim' },
        event = { 'BufRead Cargo.toml' },
        config = function()
            require('crates').setup()
        end,
    })
    -- use "mfussenegger/nvim-dap"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
