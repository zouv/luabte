
function EAttackAction()
    local randNum = util.rand(1, 4)
    local status = "SUCCESS"
    if randNum == 1 then
        status = "RUNNING"
    elseif randNum == 2 then
        status = "RUNNING"
    elseif randNum == 3 then
        status = "RUNNING"
    else
        status = "SUCCESS"
    end
    print("EAttackAction___", randNum, status)
    return status
end

function EMoveToTarget()
    return "SUCCESS"
end

function EIsTargetAlive()
    return "SUCCESS"
end

function EGlobalValue()
    return "SUCCESS"
end

