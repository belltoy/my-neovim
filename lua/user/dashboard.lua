local status_ok, db = pcall(require, "dashboard")
if not status_ok then
    return
end

-- local home = os.getenv('HOME')
