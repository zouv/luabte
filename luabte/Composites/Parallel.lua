--
-- Author: zouv
-- Date: 2016-01-11
-- Doc: 平行节点
--

Parallel = class("Parallel", Composite)
Parallel.category = NodeType.COMPOSITE

function Parallel:tick(tick)
    -- TODO
    debugLog("Parallel:tick___1", self.id, self.name)
    local status = Status.FAILURE
    for id, v in pairs(self.children) do
        local s = v:execute(tick)
        if s == Status.SUCCESS then
            status = s
        end
    end
    debugLog("Parallel:tick___2", self.id, self.name, status)
    return status
end

