return function(...)
    local player = game:service"Players".LocalPlayer
    local CurFist
    pcall(function()
        CurFist = player.Character.RightHand.Size
    end)
    local function reach(bool)
        if bool == true then
            for i,v in pairs(player.Character:GetChildren()) do
                if v.Name:find("Hand") then
                    v.Massless = true
                    v.Transparency = 1
                    v.Size = Vector3.new(20,20,20)
                    v.CanCollide = false
                end
            end
        elseif bool == false then
            for i,v in pairs(player.Character:GetChildren()) do
                if v.Name:find("Hand") then
                    v.Massless = true
                    v.Size = CurFist
                    v.Transparency = 0
                    v.CanCollide = true
                end
            end
        end
    end

    local data = ProccessArgs(...)
    local OnlyID = ReSort(Alts)[1]
    if player.UserId == OnlyID then
        local target = FindPlr(data[2])
        if data[2]:lower() == "host" then
            target = game:service"Players":GetPlayerByUserId(Settings['host'])
        end
        if target == false then
            saymsg("User not found.")
        else
            local intial = game:service"Players":GetPlayerByUserId(Settings['host']).Character.HumanoidRootPart.Position
            local x,y,z=tostring(intial.X),tostring(intial.Y),tostring(intial.Z)
            local TPLocations = {
                ['train']="595,47,-115",['club']="-266,0,-331",['admin']="-872,-33,-651",
                ['jail']="-332,21,-87",['school']="-599,21,174",['basketball']="-897,21,-538",['bank']="-375,21,-367",
                ['host']=x..","..y..","..z
            }
            local LocationData = TPLocations[data[3]:lower()] or false
            if LocationData then
                local wasanchored = player.Character.HumanoidRootPart.Anchored
                local org = player.Character.HumanoidRootPart.CFrame
                player.Character.HumanoidRootPart.Anchored = false
                repeat
                    local combat = player.Character:FindFirstChild("Combat") or player.Backpack:FindFirstChild("Combat")
                    if player.Backpack:FindFirstChild("Combat") then
                        player.Backpack:FindFirstChild("Combat").Parent = player.Character
                    end
                    reach(true)
                    player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame*CFrame.new(0,5,0)
                    player.Character:FindFirstChild("Combat"):Activate()
                    wait(0.001)
                until target.Character.BodyEffects:FindFirstChild("K.O").Value == true
                reach(false)
                repeat
                    if target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                        break
                    end
                    local x,y,z = target.Character.UpperTorso.Position.X,target.Character.UpperTorso.Position.Y,target.Character.UpperTorso.Position.Z
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(x,y+1.3,z)
                    if not target.Character:FindFirstChild("GRABBING_CONSTRAINT") then
                        game:service"ReplicatedStorage".MainEvent:FireServer("Grabbing",false)
                    end
                    wait(1)
                until target.Character:FindFirstChild("GRABBING_CONSTRAINT")
                local x,y,z = LocationData:split(",")[1],LocationData:split(",")[2],LocationData:split(",")[3]
                player.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
                wait(1)
                game:service"ReplicatedStorage".MainEvent:FireServer("Grabbing",false)
                wait(1)
                player.Character.HumanoidRootPart.CFrame = org
                wait(1)
                player.Character.HumanoidRootPart.Anchored = wasanchored
            else
                saymsg("Location doesn't exist!")
            end
        end
    end
end
