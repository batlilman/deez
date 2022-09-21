return function(...)
    local data = ProccessArgs({...})
    local players = game:service"Players"
    players.LocalPlayer.Character.HumanoidRootPart.CFrame=players[data[1]].Character.HumanoidRootPart.CFrame+Vector3.new(0,10,0)
end
