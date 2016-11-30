--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 装饰节点基类
--

Decorator = class("Decorator", BaseNode)
Decorator.category = NodeType.DECORATOR
Decorator.child = nil
Decorator.children = nil

function Decorator:ctor()
end

function Decorator:init(n)
    self.id = n.id
    self.name = n.name
    self.title = n.title
    self.parameters = n.parameters
    self.properties = n.properties
    self.description = n.description
    self.child = n.child
end

function Decorator:execute()
    print("Decorator:execute ERROR!", self.id, self.name)
    return Status.ERROR
end

