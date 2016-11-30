--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 配置
--

-- 第三方库
require("3rd.functions")
json = require("3rd.json.json")

-- 通用接口
util = require("util.util")

-- 行为树
require("luabte.BaseNode")
require("luabte.Actions.Action")
require("luabte.Actions.Wait")
require("luabte.Composites.Composite")
require("luabte.Composites.Parallel")
require("luabte.Composites.RandomSelector")
require("luabte.Composites.RandomSequence")
require("luabte.Composites.Selector")
require("luabte.Composites.Sequence")
require("luabte.Conditionals.Conditional")
require("luabte.Conditionals.FloatCompare")
require("luabte.Conditionals.FloatOperator")
require("luabte.Decorators.Decorator")
require("luabte.Decorators.Init")
require("luabte.Decorators.Interrupt")
require("luabte.Decorators.Inverter")
require("luabte.Decorators.Repeater")
require("luabte.Decorators.RepeatUntilFailure")
require("luabte.Decorators.RepeatUntilSuccess")
require("luabte.Decorators.ReturnFailure")
require("luabte.Decorators.ReturnSuccess")
require("luabte.Behavior")
require("luabte.Blackboard")
require("luabte.Tick")

BehaviorNodeTable = {
    -- Composite
    Parallel = Parallel,
    RandomSelector = RandomSelector,
    RandomSequence = RandomSequence,
    Selector = Selector,
    Sequence = Sequence,
    -- Conditional
    FloatCompare = FloatCompare,
    FloatOperator = FloatOperator,
    -- Decorator
    Interrupt = Interrupt,
    Init = Init,
    Inverter = Inverter,
    Repeater = Repeater,
    RepeatUntilFailure = RepeatUntilFailure,
    RepeatUntilSuccess = RepeatUntilSuccess,
    ReturnFailure = ReturnFailure,
    ReturnSuccess = ReturnSuccess
}

--Debug = true
