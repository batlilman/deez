return function()
    for i,v in pairs(game:service"Players".LocalPlayer.Character:GetChildren()) do
        if v:IsA("MeshPart") or v.Name:lower():find("humanoid") then
            v:Destroy()
        end
    end
end
