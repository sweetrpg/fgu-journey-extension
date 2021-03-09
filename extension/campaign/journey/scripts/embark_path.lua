--
-- Please see the license.html file included with this distribution for
-- attribution and copyright information.
--
function onInit()
    registerMenuItem(Interface.getString("list_menu_createitem"), "insert", 5);
end

function onMenuSelection(selection) if selection == 5 then addEntry(true); end end

function onListChanged()
    Debug.console("on list changed");
    EmbarkationManager.recalcPerilRating(getDatabaseNode());
    update();
    -- updateContainers();
end

function onChildAdded(source, child)
    Debug.console("on child added");
    Debug.console(source);
    -- Debug.console(child);
    -- Debug.console(self);
    -- local recordNode = JourneyManager.getRecordNode(self);
    -- Debug.console(recordNode);
    EmbarkationManager.recalcPerilRating(source);
    --
end

function onChildDeleted(source)
    Debug.console("on child deleted");
    Debug.console(source);
end

function update(bEditMode)
    -- local bEditMode = (window.parentcontrol.window.spell_type_effects_iedit
    --                       .getValue() == 1);
    for _, w in ipairs(getWindows()) do
        w.idelete.setVisibility(bEditMode);
        w.update(bEditMode);
    end
end

function addEntry(bFocus)
    local w = createWindow();
    if w then if bFocus then w.hex_id.setFocus(); end end
    return w;
end
