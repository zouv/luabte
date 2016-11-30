--
-- Author: zouv
-- Date: 2016-03-17
-- Doc: 返回成功
--

ReturnSuccess = class("ReturnSuccess", Decorator)
ReturnSuccess.category = NodeType.DECORATOR

function ReturnSuccess:execute(tick, instant)
    debugLog("ReturnSuccess:execute", instant, #tick.ActiveStack)
    local status
    if instant == true then
        status = Status.SUCCESS
    else
        status = self:tick(tick)
    end
    return status
end

function ReturnSuccess:tick(tick)
    debugLog("ReturnSuccess:tick___1")
    tick:pushNode(self.child)
    local status = self.child:execute(tick)
    if status ~= Status.RUNNING then
        tick:popNode()
        status = Status.SUCCESS
    end
    debugLog("ReturnSuccess:tick___2", status)
    return status
end

