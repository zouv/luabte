--
-- Author: zouv
-- Date: 2016-01-29
-- Doc: 全局变量
--

GlobalValue = class("GlobalValue", Decorator)
GlobalValue.category = NodeType.DECORATOR
GlobalValue.isHandle = false

function GlobalValue:execute(tick, instant)
    debugLog("GlobalValue:execute", instant, #tick.ActiveStack)
    local status
    if instant == true then
        status = tick.status
    else
        status = self:tick(tick)
    end
    return status
end

function GlobalValue:tick(tick)
    debugLog("GlobalValue:tick___", self.isHandle)
    if self.isHandle == false then
        self.isHandle = true
        EGlobalValue(self.parameters)
    end
    tick:pushNode(self.child)
    local status = self.child:execute(tick)
    if status ~= Status.RUNNING then
        tick:popNode()
    end
    return status
end
