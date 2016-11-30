--
-- Author: zouv
-- Date: 2016-03-17
-- Doc: 返回失败
--

ReturnFailure = class("ReturnFailure", Decorator)
ReturnFailure.category = NodeType.DECORATOR

function ReturnFailure:execute(tick, instant)
    debugLog("ReturnFailure:execute", instant, #tick.ActiveStack)
    local status
    if instant == true then
        status = Status.FAILURE
    else
        status = self:tick(tick)
    end
    return status
end

function ReturnFailure:tick(tick)
    debugLog("ReturnFailure:tick___1")
    tick:pushNode(self.child)
    local status = self.child:execute(tick)
    if status ~= Status.RUNNING then
        tick:popNode()
        status = Status.FAILURE
    end
    debugLog("ReturnFailure:tick___2", status)
    return status
end

