return function()
    game:service"RunService":BindToRenderStep("DROP_FUNCTION",1,function()
        game:service"ReplicatedStorage".MainEvent:FireServer("DropMoney",10000)
    end)
end
