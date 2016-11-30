--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 组合节点基类
--

Composite = class("Composite", BaseNode)
Composite.category = NodeType.COMPOSITE
Composite.child = nil
Composite.children = nil

function Composite:ctor()
end

function Composite:init(n)
    self.id = n.id
    self.name = n.name
    self.title = n.title
    self.parameters = n.parameters
    self.properties = n.properties
    self.description = n.description
    self.children = n.children
end

function Composite:execute(tick, instant)
    print("Composite:execute ERROR!", self.id, self.name, instant)
    return Status.ERROR
end

function Composite:tick(tick)
    print("Composite:tick ERROR!", self.id, self.name)
    return Status.ERROR
end

