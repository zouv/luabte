--
-- Author: zouv
-- Date: 2016-02-29
-- Doc: 目标是否存活
--

FloatCompare = class("FloatCompare", Conditional)
FloatCompare.category = NodeType.DECORATOR

function FloatCompare:execute(tick)
    debugLog("FloatCompare:execute___", self.parameters)
    return EFloatCompare(self.parameters)
end


