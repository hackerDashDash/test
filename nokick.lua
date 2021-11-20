local players = game:GetService("Players")
local lp = players.LocalPlayer
local gmt = getrawmetatable(game)
local oldNamecall = gmt.__namecall

setreadonly(gmt, false)

gmt.__namecall = newcclosure(function(Self, ...)
    local args = {...}
    local namecallMethod = getnamecallmethod()
    
    if not checkcaller() and namecallMethod == "kick" or namecallMethod == "Kick" then
        return nil
    end

    return oldNamecall(Self, ...)
end)
