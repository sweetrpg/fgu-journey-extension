--
local gameSystemText = {
    ["5E"] = {},
    ["PFRPG"] = {},
    ["PFRPG2"] = {},
    ["Genesys"] = {},
    ["TheOneRing"] = {}
};

local gameSystemNodes = {
    ["5E"] = {
        ["perception"] = {["name"] = "perception", ["path"] = "perception"},
        ["guide_skill"] = {["name"] = "Survival", ["lookup"] = get5ESkill},
        ["guide_attribute"] = {
            ["name"] = "Wisdom",
            ["path"] = "abilities.wisdom.bonus"
        }
    },
    ["PFRPG"] = {},
    ["PFRPG2"] = {},
    ["Genesys"] = {},
    ["TheOneRing"] = {}
};

function onInit()
    Debug.console("game system manager init")
    -- Debug.console(DB)

    -- local rulesetName = User.getRulesetName();
    -- Debug.console(rulesetName)

    -- set label according to game system
    -- local label = GameSystemManager.getGameSystemLabel("guide", "skill");
    -- Debug.console(label);
    -- Interface.setString("journey_party_roles_guide_attr_label", "WTF");
end

function getGameSystemValue(record, field)
    Debug.console("get game system value");
    Debug.console(record)
    if not record then return nil; end
    Debug.console(field)

    local rulesetName = User.getRulesetName();
    -- Debug.console(rulesetName)
    local fieldInfo = gameSystemNodes[rulesetName][field]
    Debug.console(fieldInfo)
    if not fieldInfo then return nil end

    local skillName = fieldInfo["name"]
    -- Debug.console(skillName)
    local fieldPath = fieldInfo["path"]
    -- Debug.console(fieldPath)
    local fieldFunc = fieldInfo["lookup"]
    Debug.console(fieldFunc)

    if fieldPath then
        -- Debug.console("got a direct path to field")
        local nodeName = record.getPath(fieldPath)
        -- Debug.console(nodeName)
        -- local node = DB.getChild(record, nodeName)
        local node = DB.findNode(nodeName)
        -- Debug.console(node)
        if node then return node.getValue() end
    elseif fieldFunc then
        Debug.console("got lookup function for field")
        local value = fieldFunc(record, skillName)
        if value then return value; end
    end

    Debug.console("nothing found, returning nil")
    return nil
end

function get5ESkill(record, skillName)
    --
    Debug.console("get 5E skill name")
    Debug.console(record)
    Debug.console(skillName)

    local skilllist = record.getPath("skilllist")
    for i, skill in ipairs(skilllist) do
        Debug.console(i)
        Debug.console(skill)
    end

    return 0
end

function getGameSystemText(component, field, type)
    Debug.console("get game system label");
    Debug.console(component)
    Debug.console(field)
    Debug.console(type)

    local rulesetName = User.getRulesetName();
    Debug.console(rulesetName)
    local stringResName = "journey_" .. component .. "_" .. field .. "_" .. type
    Debug.console(stringResName)
    local s = Interface.getString(stringResName)
    Debug.console(s)

    local t = Interface.getString("journey_party_roles_guide_attr_label");
    Debug.console(t)

    return s
end
