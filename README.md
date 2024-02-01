# How To Use
```lua
local mem = require("mem"); -- get the memory library
```

# Functions And Use
```lua
<tbl> Memory <- Library

<void> Memory:__getproc(<string> procName, <function> callback<Manager>);

<int>, <bool> Manager:read32(<int> addr);

<bool> Manager:write32(<int> addr, <int> value);

<int> Manager:__pointerscan(<tbl> data);
data args -> {
  <string> mod,
  <base> int,
  <offsets> -> <tbl> int
}
```

## See test.lua for more info
