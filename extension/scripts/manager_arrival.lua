function onInit()
    --
    ActionsManager.registerResultHandler("arrival", handleDiceLanded);
    --
end

function handleDiceLanded(rSource, rTarget, rRoll, rCustom)
    --
    -- Debug.console(rSource);
    -- Debug.console(rTarget);
    Debug.console(rRoll);
    -- Debug.console(rCustom);
    local rollType = rRoll["sType"];
    Debug.console(rollType);
    if rollType ~= "arrival" then return; end

    local dice = rRoll["aDice"];
    Debug.console(dice);
    local firstRoll = dice[1];
    Debug.console(firstRoll);
    local rollResult = firstRoll["result"];
    -- Debug.console(nodeId);
    -- local node = DB.findNode(nodeId);
    -- Debug.console(node);

    Comm.addChatMessage({
        ["text"] = "Guide's Arrival Roll",
        ["font"] = "msgfont",
        ["dice"] = dice
    });

    local nodeId = rRoll["sDesc"];
    local arrivalNode = DB.findNode(nodeId .. ".arrival");
    Debug.console(embarkNode);
    arrivalNode.getChild("roll").setValue(rollResult);

    local recordNode = JourneyManager.getRecordNode(arrivalNode);
    recalcArrivalResult(recordNode);
    --
end
