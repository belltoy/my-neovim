return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'MaximilianLloyd/ascii.nvim',
  },
  config = function()
    vim.api.nvim_create_user_command("StartScreen", function()
      vim.cmd("Alpha")
    end, {})
    vim.api.nvim_create_user_command("SplitStartScreen", function()
      vim.cmd("vsplit +Alpha")
    end, {})

    -- vim.keymap.set("n", "<leader><space>", "<cmd>Alpha<CR>", { noremap = true, silent = true, desc = "Alpha" })
    -- vim.keymap.set("n", "<leader>V", "<cmd>vsplit +Alpha<CR>", { noremap = true, silent = true, desc = "Split window | Alpha" })

    local alpha = require 'alpha'
    local startify = require'alpha.themes.startify'
    local ascii_art_neovim = require'ascii'.art.text.neovim;
    startify.section.header.val = ascii_art_neovim.dos_rebel;
    startify.section.header.opts.hl = "Directory"

    local obj = vim.system({'fortune'}, { text = true }):wait()
    local fortune = obj.stdout
    obj = vim.system({'cowsay', fortune}, { text = true }):wait()
    fortune = obj.stdout

    startify.section.footer.val = {
        { type = "text", val = fortune },
    }

    local btn_project = startify.button( "p", "  Telescope project", ":Telescope projects<CR>")
    btn_project.opts.hl = {
      { "Identifier", 0, 3 },
      { "Identifier", 15, 16 },
    }
    local btn_git = startify.button( "B", "  Telescope Git Branch", ":Telescope git_branches<CR>")
    btn_git.opts.hl = {
      { "Number", 0, 3 },
      { "Number", 19, 20 },
    }

    local btn_file = startify.button( "f", "  Telescope file" , ":Telescope find_files<CR>")
    btn_file.opts.hl = {
      { "Directory", 0, 3 },
      { "Directory", 15, 16 },
    }

    local btn_buffer = startify.button( "b", "  Telescope buffer" , ":Telescope buffers<CR>")
    btn_buffer.opts.hl = {
      { "Changed", 0, 3 },
      { "Changed", 15, 16 },
    }

    local btn_grep = startify.button( "s", "  Telescope Live Search" , ":Telescope live_grep<CR>")
    btn_grep.opts.hl = {
      { "Type", 0, 3 },
      { "Type", 20, 21 },
    }

    local btn_telescope = startify.button( "T", "  Telescope" , ":Telescope<CR>")
    btn_telescope.opts.hl = {
      { "Type", 0, 3 },
      { "Type", 5, 6 },
    }

    -- startify.section.top_buttons.val = {
    --   btn_telescope,
    --   btn_buffer,
    --   btn_project,
    --   btn_file,
    --   btn_git,
    -- }

    local btn_quit_alpha = startify.button( "q", "󰅙  Quit   Alpha" , ":Alpha<CR>")
    btn_quit_alpha.opts.hl = {
      { "Directory", 0, 3 },
      { "Directory", 6, 10 },
    }

    local btn_quit_nvim = startify.button( "Q", "󰈆  Quit   NVIM" , ":qa<CR>")
    btn_quit_nvim.opts.hl = {
      { "Ignore", 0, 3 },
      { "Ignore", 6, 10 },
    }
    local btn_edit_nvim = startify.button( "E", "  Edit   NVIM Config" , ":Neotree ~/.config/nvim/<CR>")
    btn_edit_nvim.opts.hl = {
      { "ErrorMsg", 0, 3 },
      { "ErrorMsg", 5, 9 },
    }
    local btn_reload_nvim = startify.button( "R", "  Reload NVIM Config" , ":source ~/.config/nvim/init.lua<CR>")
    btn_reload_nvim.opts.hl = {
      { "Identifier", 0, 3 },
      { "Identifier", 5, 12 },
    }

    startify.section.bottom_buttons.val = {
      btn_telescope,
      btn_buffer,
      btn_project,
      btn_file,
      btn_grep,
      btn_git,
      btn_edit_nvim,
      btn_reload_nvim,
      btn_quit_alpha,
      -- btn_quit_nvim,
    }

    alpha.setup(startify.config)
  end
};
