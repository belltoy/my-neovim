local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
    return
end

aerial.setup({
    backends = {
        ['_']  = {"treesitter", "lsp", "markdown", "man"},
        markdown = {"markdown"},
    },

    layout = {
        min_width = 40,
    },

    filter_kind = false,
})
