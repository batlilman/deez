local Destroying = false
workspace.Ignored.Drop.ChildAdded:Connect(function(child)
    if child.Parent.Name == "Drop" then
        repeat wait(0.001) until child.Parent ~= nil
        wait(2)
        if Destroying == true then
            child:Destroy()
        end
    end
end)

return function(...)
    local data = ProccessArgs(...)
    if data[2]:lower() == 'on' then
        Destroying = true
    else
        Destroying = false
    end
end
