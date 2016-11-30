--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 行为节点基类
--

Action = class("Action", BaseNode)
Action.category = NodeType.ACTION

function Action:init(n)
    self.id = n.id
    self.name = n.name
    self.title = n.title
    self.parameters = n.parameters
    self.properties = n.properties
    self.description = n.description
end

function Action:execute()
    print("Action:execute ERROR!", self.id, self.name)
    return Status.ERROR
end

