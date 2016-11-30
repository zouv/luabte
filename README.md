# luabte
Behavior Tree for lua

## examples
![exp1](https://raw.githubusercontent.com/zouv/luabte/master/examples/ai.png)


## testing
###### examples/test_ai.lua
```javascript
require("examples.test_ai_node_logic")  -- define ai node logic
Debug = true
local f = io.open("examples/ai.json", "r") -- ai data
local strJson = f:read("a")
btInit(strJson)
for i=100,1,-1 do -- behavior tree loop
    btTick()
end
```
* how to test
    * lua examples\test_ai.lua
