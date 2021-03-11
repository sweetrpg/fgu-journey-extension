function onInit()
    --
    Debug.console("party members init");
    --
end

function onDrop(x, y, dragdata)
    --
    Debug.console("party member drop");
    Debug.console(dragdata);
    --

    local w = createWindow();
    Debug.console(w);

    -- check for character type
    if dragdata.isType("shortcut") then
        local sClass, sRecord = dragdata.getShortcutData();
        Debug.console(sClass);
        Debug.console(sRecord);

        if StringManager.contains({"charsheet"}, sClass) then
            -- check if already present
            local node = w.getDatabaseNode();
            Debug.console(node);

            local linkNode = node.createChild("link");
            linkNode.setValue(sClass, sRecord);
            -- linkNode.createChild("class").setValue(sClass);
            -- linkNode.createChild("recordname").setValue(sRecord);

            -- local c = DB.findNode(sRecord);
            -- Debug.console(c);
            -- local name = c.name;
            -- node.createChild("name").setValue(name);
            -- PartyManager.addInfoDB(getDatabaseNode(), sClass, sRecord);
            return true;
        end
    end

    return false;
end

function onListChanged()
    update();
    -- updateContainers();
end

function update(bEditMode)
    -- local bEditMode = (window.parentcontrol.window.spell_type_effects_iedit
    --                       .getValue() == 1);
    for _, w in ipairs(getWindows()) do
        w.idelete.setVisibility(bEditMode);
        w.update(bEditMode);
    end
end
