--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 行为树
--

local btData = {}
btData.data = {}
btData.root = {}
btData.nodes = {}
btData.customNodes = {}

Behavior = class("Behavior")

function Behavior:ctor()
    self.id = util.createUUID()
end

function Behavior:config(customNode)
    self.custom = customNode
end

function Behavior:init(strJson)
    local data = json.decode(strJson)
    btData.title = data.title
    btData.description = data.description
    btData.rootId = data.root
    btData.nodes = data.nodes
    btData.customNodes = data.custom_nodes

    -- 自定义节点
    for k, v in ipairs(btData.customNodes) do
        btData.customNodes[v.name] = v
    end

    -- 初始化行为树节点
    local treeNodes = {}
    for k, v in pairs(btData.nodes) do
        local cls
        local node
        if BehaviorNodeTable[v.name] then
            cls = BehaviorNodeTable[v.name]
        elseif self.custom[v.name] then
            cls = self.custom[v.name]
        end
        debugLog("init ", v.id, v.name, cls ~= nil and "" or false)
        if cls then
            node = cls:new(v)
            node:init(v)
            treeNodes[node.id] = node
        end
    end

    -- 连接节点
    for k, v in pairs(btData.nodes) do
        local node = treeNodes[k]
        --print("link node___", node.id, node.name)
        -- 组合节点
        if node.category == NodeType.COMPOSITE and v.children then -- TODO 检测子节点
            local children = {}
            for i = 1, #node.children do
                local child = treeNodes[v.children[i]]
                table.insert(children, i, child)
            end
            node.children = children
            --dump(node.children, "node.children")
        -- 装饰节点
        elseif node.category == NodeType.DECORATOR and v.child then
            node.child = treeNodes[v.child]
        end
        --print("___link node", node.category, node.name, node.child, node.children)
    end

    self.id = btData.rootId
    self.root = treeNodes[btData.rootId]
    util.initRandSeed()

    debugLog("root", btData.rootId, self.id)
end

function Behavior:tick(tick)
    -- print("Behavior:tick____________________", #tick.ActiveStack)

    local status = Status.FAILURE
    tick.status = nil
    if #tick.ActiveStack > 0 then
        while #tick.ActiveStack > 0 do
            local n = tick:popNode()
            tick:pushNode(n)
            status = n:execute(tick, true)
            tick.status = status
            if status ~= Status.RUNNING then
                tick:popNode()
            else
                break
            end
        end
    else
        tick:pushNode(self.root)
        status = self.root:execute(tick)
        if status ~= Status.RUNNING then
            tick:popNode()
        end
    end
end
