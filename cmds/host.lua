return function(...)
    local data = ProccessArgs(...)
    local player = game:service"Players".LocalPlayer
    
    if data[2]:lower() == "spot" then
        pcall(function() game:service"RunService":UnbindFromRenderStep("NOCLIPPER") end)
        game:service"RunService":BindToRenderStep("NOCLIPPER",10,function()
            for i,v in pairs(game:service"Players":GetChildren()) do
                if (player.Character.HumanoidRootPart.Position-v.Character.HumanoidRootPart.Position).Magnitude <= 15 and v.Name ~= player.Name and table.find(ReSort(Alts),v.UserId) then
                    for _, c in pairs(v.Character:GetChildren()) do
                        if c:IsA("MeshPart") or c.Name == "HumanoidRootPart" then
                            c:Destroy()
                        end
                    end
                end
            end
        end)
        wait(0.2)
        local plr = game:service"Players":GetPlayerByUserId(Settings['host'])
        player.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)
    end
end
