--
-- Author: zouv
-- Date: 2016-01-29
-- Doc: 重复执行指定次数，-1为无限
--

Repeater = class("Repeater", Decorator)
Repeater.category = NodeType.DECORATOR
Repeater.times = 0

function Repeater:execute(tick, instant)
    debugLog("Repeater:execute", instant, #tick.ActiveStack)
    local status
    if instant == true then
        status = tick.status
    else
        status = self:tick(tick)
    end
    return status
end

function Repeater:tick(tick)
    -- TODO
    debugLog("Repeater:tick___1", self.times)
    tick:pushNode(self.child)
    local status = self.child:execute(tick)
    self.times = self.times + 1
    if status ~= Status.RUNNING then
        tick:popNode()
    end
    debugLog("Repeater:tick___2", self.times, self.parameters, status)
    return status
end

