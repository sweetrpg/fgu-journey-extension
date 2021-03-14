--
function handleAssignPartyRole(recordNode, role, draginfo)
    Debug.console(recordNode)
    Debug.console(role)
    Debug.console(draginfo)

    if draginfo.isType("shortcut") then
        local sClass, sRecord = draginfo.getShortcutData();
        if StringManager.contains({"charsheet"}, sClass) then
            local path = DB.getPath(recordNode, "party", "roles", role)
            Debug.console(path);
            local roleNode = DB.findNode(path);
            Debug.console(roleNode);
            roleNode.setValue(sClass, sRecord);
            -- addInf(getDatabaseNode(), sClass, sRecord);
            return true;
        end
    end
end

--
function removePartyRole(recordNode, role)
    Debug.console(recordNode)
    Debug.console(role)
    local path = recordNode.getPath("party", "roles", role)
    Debug.console(path);
    local roleNode = DB.findNode(path);
    Debug.console(roleNode);
    roleNode.setValue(nil, nil);
end
