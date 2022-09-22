function ProccessArgs(...)
    local k = {}
    for i,v in pairs(...) do
        if i ~= 1 then
            k[i] = v
        end
    end
    return k
end

function saymsg(msg)
    game:service"ReplicatedStorage".DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, 'All')
end

function CheckPlayer(userid)
    for i,v in pairs(game:service"Players":GetChildren()) do
        if v.UserId == userid then
            return true
        end
    end
    return false
end

function ReSort(table_)
    local k = {}
    for i,v in pairs(table_) do
        if CheckPlayer(v) == true then
            table.insert(k,v)
        end
    end
    return k
end

function FindPlr(arg)
    for i,v in pairs(game:service"Players":GetChildren()) do
        if v.Name:lower():find(arg:lower()) or v.DisplayName:lower():find(arg:lower()) then
            return v
        end
    end
    return false
end
