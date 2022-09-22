return function(...)
    local data = ProccessArgs(...)
    local player = game:service"Players".LocalPlayer
    
    if data[2]:lower() == "line" then
        local g = 4
        local function ReverseRotation(x)
            return x-(x*2)
        end
        local function CreateSet()
            local k = {}
            local g = 4
            for i=1,20 do
                local c = ReverseRotation(g)
                local f = ReverseRotation(c)
                g = g + 4
                table.insert(k,f)
                table.insert(k,c)
            end
            return k
        end
        local Alts_ = ReSort(Alts)
        local BaseAnchor = game:service"Players":GetPlayerByUserId(Settings['host'])
        local Set = CreateSet()
        for i=1,40 do
            if Alts_[i] == player.UserId then
                player.Character.HumanoidRootPart.CFrame = BaseAnchor.Character.HumanoidRootPart.CFrame * CFrame.new(Set[i],0,0)
                break
            end
        end
    end
end
