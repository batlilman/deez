return function()
    pcall(function() game:service"RunService":UnbindFromRenderStep("DROP_FUNCTION") end)
    pcall(function() game:service"RunService":UnbindFromRenderStep("CDROP_FUNCTION") end )

    getgenv().STOPACTIONS = true
    getgenv().LOOPDESTROY_ACTIVE = false
    wait(5)
    getgenv().STOPACTIONS = false
end
