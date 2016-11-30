--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 节点基类
--

-- 节点类型
NodeType = {
    COMPOSITE   = "COMPOSITE",      -- 复合节点
    DECORATOR   = "DECORATOR",      -- 装饰节点
    CONDITIONAL = "CONDITIONAL",    -- 行为节点
    ACTION      = "ACTION"          -- 条件节点
}

-- 节点状态
Status = {
    SUCCESS = "SUCCESS",            -- 成功
    FAILURE = "FAILURE",            -- 失败
    RUNNING = "RUNNING",            -- 运行
    ERROR   = "ERROR"               -- 错误
}

BaseNode = class("BaseNode")
BaseNode.__index = BaseNode
BaseNode.category = nil
BaseNode.name = nil
BaseNode.title = nil
BaseNode.description = ""
BaseNode.id = nil
BaseNode.parameters = {}
BaseNode.properties = {}
BaseNode.display = nil
BaseNode.tick = nil

function BaseNode:ctor()
    self.id = util.createUUID()
end

function BaseNode:init(n)
    self.name = n.name or ""
    self.title = n.title or ""
end

function BaseNode:execute()
    debugLog("BaseNode:execute___", self.id, self.name)
end

function BaseNode:tick()
    debugLog("BaseNode:tick___", self.id, self.name)
end

