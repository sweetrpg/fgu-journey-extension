function onInit()
    --
    Debug.console("journey manager init");
    Debug.console("root");
    Debug.console(DB.getRoot());
    Debug.console("frames")
    Debug.console(Interface.getFrames());
    Debug.console("icons")
    Debug.console(Interface.getIcons());
    Debug.console("fonts")
    Debug.console(Interface.getFonts());
    --
end

function getRecordNode(node)
    -- Debug.console(node);
    if not node then return nil; end
    if not node.getParent() then return nil; end
    --
    local id = nil
    while true do
        if isID(node) then id = node.getName(); end
        -- Debug.console(id);
        local parent = node.getParent();
        -- Debug.console(parent);
        if not parent then
            -- Debug.console("node does not have parent")
            local nodeId = DB.getPath(node, id);
            -- Debug.console(nodeId);
            local recordNode = DB.findNode(nodeId);
            -- Debug.console(recordNode);
            return recordNode;
        else
            node = parent;
            -- Debug.console(node);
        end
    end
    -- while node.getParent() do node = node.getParent() end
    -- Debug.console(node);
    -- return node;
end

function getItemNode(node)
    ---
    Debug.console("get item node");
    Debug.console(node);
    if not node.getParent() then return nil; end
    while true do
        if isID(node) then return node; end
        Debug.console("node is not an ID");
        node = node.getParent();
        Debug.console(node);
    end
    ---
end

function isID(node)
    -- Debug.console("isID");
    -- Debug.console(node);
    local name = "";
    if type(node) == "string" then
        -- Debug.console("node is a string");
        name = node;
        -- Debug.console(name);
    else
        -- Debug.console("node is a node");
        name = node.getName();
        -- Debug.console(name);
    end
    if string.find(name, "^id%-%d+$") then
        -- Debug.console("is an ID");
        return true;
    end
    -- Debug.console("is not an ID");
    return false
end
