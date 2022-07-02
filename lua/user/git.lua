local status_ok, gitlinker = pcall(require, "gitlinker")
if not status_ok then
    return
end

vim.api.nvim_set_keymap('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>gB', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>go', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})

gitlinker.setup({
    callbacks = {
        ["registry.code.tuya-inc.top"] = require"gitlinker.hosts".get_gitlab_type_url
    }
})

vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>lua require("agitator").git_blame_toggle()<cr>', {silent = true})
