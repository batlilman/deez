return function(...)
    local data = ProccessArgs(...)
    local plr = game:service"Players".LocalPlayer
    if data[2] == "show" then
        plr.Backpack:FindFirstChild("Wallet").Parent = plr.Character
    elseif data[2] == "hide" then
        plr.Character:FindFirstChild("Wallet").Parent = plr.Backpack
    end
end
