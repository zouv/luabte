--
-- Author: zouv
-- Date: 2016-01-05
-- Doc: 工具
--

local util = {}

-- 创建UUID
function util.createUUID()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    local replFun = function (c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
    end
    return string.gsub(template, '[xy]', replFun)
end

-- 遍历table
local l_ergodicTable
l_ergodicTable = function(str, t, b)
    local strTab = " "
    for i,v in pairs(t) do
        if b == true and type(v) == "table" then
            l_ergodicTable(str .. strTab, v, b)
        else
            print(str, i, v)
        end
    end
end

function util.ergodicTable(str, t, b)
    l_ergodicTable(str, t, b)
end

function debugLog(...) 
    if Debug ~= nil then
        print("[DEBUG_LOG:]", ...)
    end
end

-- 初始化随机数种子
function util.initRandSeed()
    math.randomseed(os.time())
end

-- 取随机数
function util.rand(min, max)
    if min == max then
        return min
    elseif min > max then
        local temp = min
        min = max
        max = temp
    end
	min = min - 1
	return math.random(max - min) + min
end

-- table拷贝
function util.copyTable(st, recursion)
    local newTab = {}
    for k, v in pairs(st or {}) do
        if type(v) == "table" then
            if recursion == nil then
                newTab[k] = v
            else
                newTab[k] = util.copyTable(v, recursion)
            end
        else
            newTab[k] = v
        end
    end
    return newTab
end

return util

