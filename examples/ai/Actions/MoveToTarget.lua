--
-- Author: zouv
-- Date: 2016-01-29
-- Doc: 移到目标
--

MoveToTarget = class("MoveToTarget", Action)
MoveToTarget.category = NodeType.ACTION

function MoveToTarget:execute()
    debugLog("MoveToTarget:execute___", self.name)
    return EMoveToTarget(self.parameters)
end

