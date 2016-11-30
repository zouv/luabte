--
-- Author: zouv
-- Date: 2016-01-29
-- Doc: 重复执行直至失败
--

RepeatUntilFailure = class("RepeatUntilFailure", Decorator)
RepeatUntilFailure.category = NodeType.DECORATOR

function RepeatUntilFailure:execute(tick, instant)
    debugLog("RepeatUntilFailure:execute", instant, tick.status, #tick.ActiveStack)
    local status
    if instant == true then
        if tick.status == nil then
            status = self:tick(tick)
        elseif tick.status ~= Status.FAILURE then
            status = Status.RUNNING
        else
            status = tick.status
        end
    else
        status = self:tick(tick)
    end
    return status
end

function RepeatUntilFailure:tick(tick)
    debugLog("RepeatUntilFailure:tick___1")
    tick:pushNode(self.child)
    local status = self.child:execute(tick)
    debugLog("RepeatUntilFailure:tick___11", status)
    if status ~= Status.RUNNING then
        tick:popNode()
        if status ~= Status.FAILURE then
            status = Status.RUNNING
        end
    end
    debugLog("RepeatUntilFailure:tick___2", status)
    return status
end

