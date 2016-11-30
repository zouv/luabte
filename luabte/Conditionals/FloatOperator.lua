--
-- Author: zouv
-- Date: 2016-02-29
-- Doc: 目标是否存活
--

FloatOperator = class("FloatOperator", Conditional)
FloatOperator.category = NodeType.DECORATOR

function FloatOperator:execute(tick)
    debugLog("FloatOperator:execute___", self.parameters)
    return EFloatOperator(self.parameters)
end


