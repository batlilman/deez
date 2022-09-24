return function(...)
    local data = ProccessArgs(...)
    setfpscap(tonumber(data[2]))
end
