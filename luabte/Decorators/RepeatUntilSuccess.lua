--
-- Author: zouv
-- Date: 2016-01-29
-- Doc: 重复执行直至成功
--

RepeatUntilSuccess = class("RepeatUntilSuccess", Decorator)
RepeatUntilSuccess.category = NodeType.DECORATOR

function RepeatUntilSuccess:execute(tick, instant)
    debugLog("RepeatUntilSuccess:execute", instant, tick.status, #tick.ActiveStack)
    local status
    if instant == true then
        if tick.status == nil then
            status = self:tick(tick)
        elseif tick.status ~= Status.SUCCESS then
            status = Status.RUNNING
        else
            status = tick.status
        end
    else
        status = self:tick(tick)
    end
    return status
end

function RepeatUntilSuccess:tick(tick)
    debugLog("RepeatUntilSuccess:tick___1")
    tick:pushNode(self.child)
    local status = self.child:execute(tick)
    debugLog("RepeatUntilSuccess:tick___11", status)
    if status ~= Status.RUNNING then
        tick:popNode()
        if status ~= Status.SUCCESS then
            status = Status.RUNNING
        end
    end
    debugLog("RepeatUntilSuccess:tick___2", status)
    return status
end

