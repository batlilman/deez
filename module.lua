function ProccessArgs(x)
    local k = {}
    for i,v in pairs(x) do
        if i ~= 1 then
            k[i] = v
        end
    end
    return k
end
