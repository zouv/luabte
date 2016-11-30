--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 条件节点基类
--

Conditional = class("Conditional", BaseNode)
Conditional.category = NodeType.DECORATOR
Conditional.child = nil
Conditional.children = nil

function Conditional:ctor()
end

function Conditional:init(n)
    self.id = n.id
    self.name = n.name
    self.title = n.title
    self.parameters = n.parameters
    self.properties = n.properties
    self.description = n.description
end

function Conditional:execute()
    print("Conditional:execute ERROR!", self.id, self.name)
    return Status.ERROR
end

