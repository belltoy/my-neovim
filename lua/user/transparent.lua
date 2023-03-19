local status_ok, transparent = pcall(require, 'transparent')
if not status_ok then
    return
end

vim.g.transparent_enabled = false
transparent.setup({
    groups = {
    },
    extra_groups = {
        'WinSeparator',
        'VertSplit',
        'Pmenu',
        'PmenuSbar',
    },
    exclude_groups = {},
})
