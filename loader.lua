local sourceURL = "https://raw.githubusercontent.com/bob123dx-dotcom/concacmemay-Hub/refs/heads/main/main_script.lua"

local success, result = pcall(function()
    return game:HttpGet(sourceURL)
end)

if success then
    loadstring(result)()
else
    warn("Không thể tải source code mới!")
end
