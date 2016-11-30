--
-- Author: zouv
-- Date: 2016-03-22
-- Doc: 全局变量
--

Init = class("Init", Decorator)
Init.category = NodeType.DECORATOR
Init.isHandle = false

function Init:execute(tick)
    debugLog("Init:execute___", self.isHandle)
    local status = Status.SUCCESS
    if self.isHandle == false then
        self.isHandle = true
        status = self.child:execute(tick)
    end
    return status
end

