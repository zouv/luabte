--
-- Author: zouv
-- Date: 2016-01-11
-- Doc: 攻击
--

AttackAction = class("AttackAction", Action)
AttackAction.category = NodeType.ACTION

function AttackAction:execute()
    debugLog("AttackAction:execute___", self.name)
    return EAttackAction(self.parameters)
end

