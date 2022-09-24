--// Configurations

getgenv().Settings = {
    host = 123456789,
    prefix = '/',
    fps = 3,
    admsg = 'free'
}

getgenv().Alts = {
    123456789,
    123456789,
}

--// Main code, made by remorse

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local player = game:service"Players".LocalPlayer
local ws = workspace

local ishost = player.UserId == Settings['host']
if not ishost then
    settings().Physics.PhysicsEnvironmentalThrottle = 1
    settings().Rendering.QualityLevel = 'Level01'
    UserSettings():GetService("UserGameSettings").MasterVolume = 0
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("Part") then
            v.Material = Enum.Material.Pavement
            v.Transparency = 1
        elseif v:IsA("Decal") then
            v:Destroy()
        elseif v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("MeshPart") then
            v.TextureID = 0
            v.Transparency = 1
        elseif v.Name == "Terrian" then
            v.WaterReflectace = 1
            v.WaterTransparency = 1
        elseif v:IsA("SpotLight") then
            v.Range = 0
            v.Enabled = false
        elseif v:IsA("WedgePart") then
            v.Transparency = 1
        elseif v:IsA("UnionOperation") then
            v.Transparency = 1
        end
    end
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    
    ScreenGui.Parent = game:service"CoreGui"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "UltraHider10000000"
    
    Frame.Parent = ScreenGui
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    Frame.BorderColor3 = Color3.fromRGB(11, 11, 11)
    Frame.BorderSizePixel = 100
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0.416597515, 0, 0.461769104, 0)
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.Text = game:service"Players".LocalPlayer.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 30.000
    pcall(function() setfpscap(Settings['fps']) end)
end

--// Alt control stuff
local PackageLoader = "https://raw.githubusercontent.com/batlilman/deez/main/cmds/"
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/batlilman/deez/main/module.lua"))() end)
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/batlilman/deez/main/anticheat.lua"))() end)
local player = game:service"Players".LocalPlayer
local LoadedPackages, LoadedFunctions = {}, {}

local function LoadPackage(name)
    local meta = LoadedPackages[tostring(name:lower())] or false
    if meta ~= false then
        return "already loaded"
    end
    LoadedPackages[tostring(name:lower())] = true   
    local request = HttpPost or request or http_request or syn.request
    local data = request({Url=PackageLoader..""..name:lower()..".lua"})
    if tonumber(data.StatusCode) ~= 200 then
        return "none"
    end
    LoadedFunctions[tostring(name:lower())] = loadstring(data.Body)()
    return "loaded"
end

local function cmds(msg, plr)
    if ishost == false then
        msg = msg:lower()
        local prefix = tostring(Settings['prefix'])
        if tostring(msg):find(tostring(prefix:lower())) and not tostring(msg):find(" ") then
            local que = msg:gsub(prefix,"")
            local data = LoadPackage(que)
            if data ~= "none" then
                LoadedFunctions[que]()
            end
        else
            local org = msg
            msg = msg:split(" ")
            if tostring(msg[1]):find(tostring(prefix:lower())) then
                local que = msg[1]:gsub(prefix,"")
                local data = LoadPackage(que)
                if data ~= "none" then
                    LoadedFunctions[que](msg)
                end
            end
        end
    end
end
game:service"Players".LocalPlayer.Idled:connect(function()
	game:service"VirtualUser":Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:service"VirtualUser":Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

game:service"ReplicatedStorage".DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data) 
    local user = data.FromSpeaker
    local msg = data.Message
    if game:service"Players":FindFirstChild(user).UserId == Settings['host'] then
        cmds(msg, game:service"Players":FindFirstChild(user).UserId)
    end
end)
print("executed lololo")
