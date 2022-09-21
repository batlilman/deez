local goal, cur = 0, 0
workspace.Ignored.Drop.ChildAdded:Connect(function(child)
    if child.Parent.Name == "Drop" then
        repeat wait(0.001) until child.Parent ~= nil
        local g = child.BillboardGui.TextLabel.Text:gsub("%,",""):gsub("%$","")
        cur = cur + tonumber(g)
        if cur >= goal then
            game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION")
            saymsg("finished")
        end
        if getgenv().LOOPDESTROY_ACTIVE == true then
            child:Destroy()
        end
    end
end)

return function(...)
    local data = ProccessArgs(...)
    local plr = game:service"Players".LocalPlayer
    
    local function Convert(arg)
        local int = tonumber
        local signs = {
			k = int(10e2),
			m = int(10e5),
			b = int(10e8),
			t = int(10e11)
		}
        for item in next, signs do
            if arg:lower():find(item:lower()) then
                local _convert_ = int(signs[item])
                local new = arg:lower():gsub(item,"")
                return new*_convert_
            end
        end
        if not tonumber(arg) then
            return false
        end
        return tonumber(arg)
    end

    local converted = Convert(data[2])
    if converted == false then return end
    cur = 0
    goal = tonumber(converted)

    saymsg("Started...")
    game:service"RunService":BindToRenderStep("CDROP_FUNCTION",1,function()
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",10000)
    end)
end
