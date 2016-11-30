--
-- Author: zouv
-- Date: 2016-01-29
-- Doc: 随机顺序执行节点
--

RandomSequence = class("RandomSequence", Composite)
RandomSequence.category = NodeType.COMPOSITE
RandomSequence.tickChildren = {}

function RandomSequence:execute(tick, instant)
    debugLog("RandomSequence:execute", instant, #tick.ActiveStack, #self.tickChildren)
    local status
    if instant == true then
        if tick.status == Status.FAILURE then
            status = tick.status
        else
            status = self:tick(tick)
        end
    else
        self.tickChildren = self.children
        status = self:tick(tick)
    end
    return status
end

function RandomSequence:tick(tick)
    debugLog("RandomSequence:tick___1")
    local status
    local children = util.copyTable(self.tickChildren)
    while #children > 0 do
        local randNum = util.rand(1, #children)
        local node = children[randNum]
        tick:pushNode(node)
        status = node:execute(tick)
        if status ~= Status.RUNNING then
            tick:popNode()
        end
        table.remove(children, randNum)
        if status == Status.FAILURE then
            break
        elseif status == Status.RUNNING then
            self.tickChildren = children
            break
        end
    end
    debugLog("RandomSequence:tick___2", status, #self.children, #self.tickChildren)
    return status
end

