return function()
    local plr = game:service"Players".LocalPlayer
    if plr.Character:FindFirstChild("BodyEffects"):FindFirstChild("Attacking") then
        plr.Character:FindFirstChild("BodyEffects"):FindFirstChild("Attacking"):Destroy()
    end
end
