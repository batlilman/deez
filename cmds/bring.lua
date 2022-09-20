local a = function bringcmd(...)
    local data = {...}
    local players = game:service"Players"
    players.LocalPlayer.Character.HumanoidRootPart.CFrame=players[data[1]].Character.HumanoidRootPart.CFrame+Vector3.new(0,10,0)
end

return a
