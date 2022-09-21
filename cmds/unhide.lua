return function()
    local players = game:service"Players"
    local plr = players:GetPlayerByUserId(Settings['host'])
    if plr then
        players.LocalPlayer.Character.HumanoidRootPart.CFrame=plr.Character.HumanoidRootPart.CFrame+Vector3.new(0,10,0)
    end
end
