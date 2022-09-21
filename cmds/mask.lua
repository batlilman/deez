return function(...)
    local data = ProccessArgs(...)
    local plr = game:service"Players".LocalPlayer
    local maskItem, maskPrice, maskShop, ws = "Mask", 25, "[Surgeon Mask] - $25", workspace
    if data[2] == "on" then
        local item = plr.Backpack:FindFirstChild(maskItem) or plr.Character:FindFirstChild(maskItem)
        if not item then
            local org = plr.Character.HumanoidRootPart.CFrame
            local wasanchored = plr.Character.HumanoidRootPart.Anchored
            plr.Character.HumanoidRootPart.Anchored = false
            repeat
                plr.Character.HumanoidRootPart.CFrame = ws.Ignored.Shop:FindFirstChild(maskShop).Head.CFrame+Vector3.new(0,2,0)
                fireclickdetector(ws.Ignored.Shop:FindFirstChild(maskShop).ClickDetector)
                wait(0.001)
            until plr.Backpack:FindFirstChild(maskItem) or plr.Character:FindFirstChild(maskItem) or plr.Character.DataFolder.Currency.Value <= plr.Character.DataFolder.Currency.Value - maskPrice
            wait()
            plr.Character.HumanoidRootPart.CFrame = org
            wait(0.45)
            plr.Character.HumanoidRootPart.Anchored = wasanchored
        end
        if not plr.Character:FindFirstChild("In-gameMask") then
            if plr.Backpack:FindFirstChild(maskItem) then
                plr.Backpack:FindFirstChild(maskItem).Parent = plr.Character
            end
            plr.Character:FindFirstChild(maskItem):Activate()
            if plr.Character:FindFirstChild(maskItem) then
                plr.Character:FindFirstChild(maskItem).Parent = plr.Backpack
            end
        end
    elseif data[2] == "off" then
        if plr.Character:FindFirstChild("In-gameMask") then
            if plr.Backpack:FindFirstChild(maskItem) then
                plr.Backpack:FindFirstChild(maskItem).Parent = plr.Character
            end
            plr.Character:FindFirstChild(maskItem):Activate()
            if plr.Character:FindFirstChild(maskItem) then
                plr.Character:FindFirstChild(maskItem).Parent = plr.Backpack
            end
        end
    end
end
