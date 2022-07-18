local status_ok, transparent = pcall(require, 'transparent')
if not status_ok then
    return
end

vim.g.transparent_enabled = true
transparent.setup({
    enable = true,
    extra_groups = {
        'WinSeparator',
        'VertSplit',
        'Pmenu',
        'PmenuSbar',
    },
    exclude = {},
})
