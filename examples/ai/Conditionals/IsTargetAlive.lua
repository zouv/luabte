--
-- Author: zouv
-- Date: 2016-01-29
-- Doc: 目标是否存活
--

IsTargetAlive = class("IsTargetAlive", Conditional)
IsTargetAlive.category = NodeType.DECORATOR

function IsTargetAlive:execute(tick)
    debugLog("IsTargetAlive:execute___")
    return EIsTargetAlive(self.parameters)
end

