--
-- Author: zouv
-- Date: 2016-01-12
-- Doc: Tick
--

Tick = class("Tick")

Tick.ActiveStack = {}
Tick.status = nil

function Tick:pushNode(node)
    table.insert(self.ActiveStack, node)
end

function Tick:popNode()
    return table.remove(self.ActiveStack)
end

