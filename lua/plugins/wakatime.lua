local api_key = os.getenv("WAKATIME_API_KEY")
local enabled = false

if api_key == nil then
  enabled = false
else
  enabled = true
end

return {
  'wakatime/vim-wakatime',
  enabled = enabled,
}
