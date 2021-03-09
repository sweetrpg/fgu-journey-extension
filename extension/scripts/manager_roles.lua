function handleAssignPartyRole(role, draginfo)
    Debug.console(role)
    Debug.console(draginfo)

    if draginfo.isType("shortcut") then
        local sClass, sRecord = draginfo.getShortcutData();
        if StringManager.contains({"srpg_spell_type"}, sClass) then
            -- addInf(getDatabaseNode(), sClass, sRecord);
            return true;
        end
    end
end
