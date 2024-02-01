local Memory = {}

function Memory:__getproc(procname, callback)
    local process = getproc(procname)
    local Manager = {}
    function Manager:read32(addr)
        local r = process.read_int(addr)
        return r, true
    end

    function Manager:write32(addr, value)
        process.write_int(tonumber(addr), tonumber(value))
        return true
    end

    function Manager:__pointerscan(tbl)
        if type(tbl) ~= "table" then return end
        if tbl.mod == nil or type(tbl.mod) ~= "string" then return end
        if tbl.base == nil or type(tbl.base) ~= "number" then return end
        if tbl.offsets == nil or type(tbl.offsets) ~= "table" then return end

        local module = getmodule(process.process_handle, tostring(tbl.mod))
        local addr = process.read_int(module + tbl.base)
        for i, v in pairs(tbl.offsets) do
            if i ~= #tbl.offsets then
                addr = process.read_int(addr + v)        
            end
        end
        return addr + tbl.offsets[#tbl.offsets]
    end
    callback(process.process_id, Manager)
end

return Memory