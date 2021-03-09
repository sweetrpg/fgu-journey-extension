function onInit()
    --
    ActionsManager.registerResultHandler("embarkation", handleDiceLanded);
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
    if rollType ~= "embarkation" then return; end

    local dice = rRoll["aDice"];
    Debug.console(dice);
    local firstRoll = dice[1];
    Debug.console(firstRoll);
    local rollResult = firstRoll["result"];
    -- Debug.console(nodeId);
    -- local node = DB.findNode(nodeId);
    -- Debug.console(node);

    Comm.addChatMessage({
        ["text"] = "Guide's Embarkation Roll",
        ["font"] = "msgfont",
        ["dice"] = dice
    });

    local nodeId = rRoll["sDesc"];
    local embarkNode = DB.findNode(nodeId .. ".embarkation");
    Debug.console(embarkNode);
    embarkNode.getChild("roll").setValue(rollResult);

    local recordNode = JourneyManager.getRecordNode(embarkNode);
    recalcEmbarkationResult(recordNode);
    --
end

function recalcEmbarkationResult(recordNode)
    --
    Debug.console("recalc embarkation result");
    if not recordNode then return; end
    Debug.console(recordNode);
    local embarkNode = recordNode.getChild("embarkation");
    Debug.console(embarkNode);

    local embarkRoll = embarkNode.getChild("roll").getValue() or 0;
    local guideSkillMod =
        embarkNode.getChild("guide_skill_modifier").getValue() or 0;
    local guideAttrMod =
        embarkNode.getChild("guide_attr_modifier").getValue() or 0;
    local perilRating =
        embarkNode.getChild("highest_peril_rating").getValue() or 0;

    local embarkResult = embarkRoll + guideSkillMod + guideAttrMod + perilRating;
    embarkNode.getChild("result").setValue(embarkResult);
    --
end

function recalcPerilRating(listNode)
    --
    Debug.console("recalc peril rating");
    Debug.console(listNode);
    -- Debug.console(node.getDatabaseNode());
    -- local pathlist = node.getParent();
    -- Debug.console(pathlist);

    local perilRating = 0;
    for _, pathItem in pairs(listNode.getChildren()) do
        Debug.console(pathItem);
        local basePerilRating = pathItem.getChild("base_peril_rating")
                                    .getValue() or 0;
        local adjustments = pathItem.getChild("adjustments").getValue() or 0;
        local pathPerilRating = basePerilRating + adjustments;

        if pathPerilRating > perilRating then
            perilRating = pathPerilRating;
        end
    end

    local perilRatingNodeId = DB.getPath(listNode.getParent(),
                                         "highest_peril_rating");
    local perilRatingNode = DB.findNode(perilRatingNodeId);
    Debug.console(perilRatingNode);
    perilRatingNode.setValue(perilRating);

    local recordNode = JourneyManager.getRecordNode(listNode);
    recalcEmbarkationResult(recordNode);
    --
end

function onReceiveOOBMessage(data)
    --
    Debug.console("on receive OOB message");
    Debug.console(data);
    --
end
