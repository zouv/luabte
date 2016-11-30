--
-- Author: zouv
-- Date: 2016-01-29
-- Doc: 对结果取反
--

Inverter = class("Inverter", Decorator)
Inverter.category = NodeType.DECORATOR

function Inverter:execute(tick, instant)
    debugLog("Inverter:execute", instant, #tick.ActiveStack)
    local status
    if instant == true then
        if tick.status == Status.SUCCESS then
            status = Status.FAILURE
        elseif tick.status == Status.FAILURE then
            status = Status.SUCCESS
        end
    else
        status = self:tick(tick)
    end
    return status
end

function Inverter:tick(tick)
    debugLog("Inverter:tick___1", self.child.name)
    tick:pushNode(self.child)
    local status = self.child:execute(tick)
    debugLog("Inverter:tick___11", status)
    if status ~= Status.RUNNING then
        tick:popNode()
        if status == Status.SUCCESS then
            status = Status.FAILURE
        elseif status == Status.FAILURE then
            status = Status.SUCCESS
        end
    end
    debugLog("Inverter:tick___2", status)
    return status
end


