local mem = require("mem")

mem:__getproc("ac_client.exe", function(procid, manager)
    print("Assault Cube Loaded -> " .. tohex(procid))
    local scan = manager:__pointerscan{
        mod = "ac_client.exe",
        base = 0x0017A85C,
        offsets = {0x94, 0x44, 0x0};
    }
    local did_write = manager:write32(scan, 88888);
    print(did_write);

    local val, did_read = manager:read32(scan);
    print(val, did_read)
end)