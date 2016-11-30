--
-- Author: zouv
-- Date: 2016-01-13
-- Doc: 
--

require("luabte.Config")
require("3rd.functions")

-- ai node
require("examples.ai.Actions.AttackAction")
require("examples.ai.Actions.MoveToTarget")
require("examples.ai.Conditionals.IsTargetAlive")
require("examples.ai.Decorators.GlobalValue")

-- ai clase define
customTable = {
    -- Actions
    AttackAction = AttackAction,
    MoveToTarget = MoveToTarget,
    -- Conditionals
    IsTargetAlive = IsTargetAlive,
    -- Decorators
    GlobalValue = GlobalValue
}

Debug = true
local tick = Tick:new()
local bt = Behavior:new()

function btInit(s)
    bt:config(customTable)
    bt:init(s)
end

function btTick()
    bt:tick(tick)
end

-- start test
require("examples.test_ai_node_logic")  -- define ai node logic
Debug = true
local f = io.open("examples/ai.json", "r") -- ai data
local strJson = f:read("a")
btInit(strJson)
for i=100,1,-1 do -- behavior tree loop
    btTick()
end

