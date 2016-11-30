--
-- Author: zouv
-- Date: 2016-03-18
-- Doc: 中断
--

Interrupt = class("Interrupt", Decorator)
Interrupt.category = NodeType.DECORATOR

function Interrupt:execute(tick, instant)
    debugLog("Interrupt:execute", instant, #tick.ActiveStack)
    local status
    if instant == true then
        status = tick.status
    else
        status = self:tick(tick)
    end
    return status
end

function Interrupt:tick(tick)
    -- TODO
    debugLog("Interrupt:tick___1", self.child.name)
    tick:pushNode(self.child)
    local status = self.child:execute(tick)
    if status ~= Status.RUNNING then
        thick:popNode()
    end
    debugLog("Interrupt:tick___2", status)
    return status
end


