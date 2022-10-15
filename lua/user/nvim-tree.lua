-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
    return
end

-- Replaces auto_close
local tree_cb = nvim_tree_config.nvim_tree_callback
vim.api.nvim_create_autocmd('BufEnter', {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
            vim.cmd('quit')
        end
    end,
})

nvim_tree.setup({
    prefer_startup_root = true,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    open_on_setup_file = true,
    ignore_buffer_on_setup = true,
    ignore_ft_on_setup = {
        'gitcommit',
        'gitrebase',
        -- "startify",
        -- "dashboard",
        -- "alpha",
    },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    respect_buf_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        update_root = false,
        ignore_list = {},
    },
    system_open = {
        cmd = 'open',
        args = {},
    },
    filters = {
        dotfiles = true,
        custom = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    renderer = {
        icons = {
            git_placement = 'after',
            glyphs = {
                default = '',
                symlink = '',
                git = {
                    unstaged = '',
                    staged = 'S',
                    unmerged = '',
                    renamed = '➜',
                    deleted = '',
                    untracked = 'U',
                    ignored = '◌',
                },
                folder = {
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                },
            },
        },
    },
    view = {
        width = 30,
        -- height = 30,
        hide_root_folder = false,
        side = 'left',
        mappings = {
            custom_only = false,
            list = {
                { key = { '<CR>', 'o' }, cb = tree_cb('edit') },
                { key = 'h', cb = tree_cb('close_node') },
                { key = 'x', cb = tree_cb('close_node') },
                { key = 'H', action = '' },
                { key = 'C', action = 'cd' },
                { key = "p", action = "parent_node" },
                { key = "P", action = "paste" },
                { key = 'v', cb = tree_cb('vsplit') },
                { key = 's', cb = tree_cb('split') },
                { key = 'O', cb = tree_cb('system_open') },
                { key = '?', cb = tree_cb('toggle_help') },
                { key = 't', cb = tree_cb('tabnew') },
                { key = 'D', cb = tree_cb('toggle_dotfiles') },
                { key = 'I', cb = tree_cb('toggle_git_ignored') },
                { key = 'U', cb = tree_cb('toggle_custom') },
            },
        },
        number = false,
        relativenumber = false,
    },
    trash = {
        cmd = 'trash',
        require_confirm = true,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = false,
            },
        },
    },

    --  unknown options as of 22.05
    --
    --  update_to_buf_dir = {
    --    enable = true,
    --    auto_open = true,
    --  },
    --  auto_resize = true,
    --  git_hl = 1,
    --  root_folder_modifier = ":t",
})
