local status_ok, urlview = pcall(require, 'urlview')
if not status_ok then
    return
end

urlview.setup({
    navigate_method = 'system',
})

local tele_status_ok, telescope = pcall(require, 'telescope')
if not tele_status_ok then
    return
end

telescope.load_extension('urlview')
