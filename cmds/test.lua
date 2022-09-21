return function(...)
    local data = ProccessArgs(...)
    for i,v in pairs(data)  do print(i,v) end
end
