local Adverting = false

return function(...)
    local data = ProccessArgs(...)
    if data[2]:lower() == "set" then
        local NewMsg = ""
        for i=3,#data do
            if i == #data then
                NewMsg = NewMsg..""..tostring(data[i])
            else
                NewMsg = NewMsg..""..tostring(data[i]).." "
            end
        end
        Settings['admsg'] = NewMsg
    elseif data[2]:lower() == "on" then
        Adverting = true
        while Adverting == true do
            wait(2.5)
            saymsg(Settings['admsg'])
        end
    elseif data[2]:lower() == "off" then
        Adverting = false
    end
end
