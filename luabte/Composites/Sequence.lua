--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 顺序节点
--

Sequence = class("Sequence", Composite)
Sequence.category = NodeType.COMPOSITE
Sequence.tickIndex = 0

function Sequence:execute(tick, instant)
    debugLog("Sequence:execute", instant, #tick.ActiveStack, self.tickIndex)
    local status
    if instant == true then
        if tick.status == Status.FAILURE then
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

function Sequence:tick(tick)
    debugLog("Sequence:tick___1")
    local status = Status.SUCCESS
    for id, v in pairs(self.children) do
        if id > self.tickIndex then
            tick:pushNode(v)
            status = v:execute(tick)
            if status ~= Status.RUNNING then
                tick:popNode()
            end
            if status == Status.FAILURE then
                break
            elseif status == Status.RUNNING then
                self.tickIndex = id
                break
            end
        end
    end
    debugLog("Sequence:tick___2", status, self.tickIndex, #tick.ActiveStack)
    return status
end

