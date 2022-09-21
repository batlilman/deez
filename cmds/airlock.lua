return function()
    if workspace:FindFirstChild("AirlockPart") then
        workspace:FindFirstChild("AirlockPart"):Destroy()
    end
    local plr = game:service"Players".LocalPlayer
    local Part = Instance.new("Part",workspace)
    Part.Name = "AirlockPart"
    Part.Size = Vector3.new(4,1.2,4)
    Part.Transparency = 1
    Part.CFrame = plr.Character.HumanoidRootPart.CFrame+Vector3.new(0,10,0)
    Part.Anchored = true
    plr.Character.HumanoidRootPart.CFrame = Part.CFrame+Vector3.new(0,2.5,0)
    wait(0.25)
    plr.Character.HumanoidRootPart.Anchored = true
end
