--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 选择节点
--

Selector = class("Selector", Composite)
Selector.category = NodeType.COMPOSITE
Selector.tickIndex = 0

function Selector:execute(tick, instant)
    debugLog("Selector:execute", instant, #tick.ActiveStack, self.tickIndex)
    local status
    if instant == true then
        if tick.status == Status.SUCCESS then
            status = tick.status
        else
            status = self:tick(tick)
        end
    else
        self.tickIndex = 0
        status = self:tick(tick)
    end
    return status
end

function Selector:tick(tick)
    debugLog("Selector:tick___1")
    local status = Status.SUCCESS
    for id, v in pairs(self.children) do
        if id > self.tickIndex then
            tick:pushNode(v)
            status = v:execute(tick)
            if status ~= Status.RUNNING then
                tick:popNode()
            end
            if status == Status.SUCCESS then
                break
            elseif status == Status.RUNNING then
                self.tickIndex = id
                break
            end
        end
    end
    debugLog("Selector:tick___2", status, self.tickIndex, #tick.ActiveStack)
    return status
end

