local dragging = false;

function onInit()
    Debug.console("Initializing die roller button...");

    if rollable or (gmrollable and User.isHost()) then
        local w = addBitmapWidget("field_rollable");
        --		w.setPosition("bottomleft", -1, -4);
        Debug.console("Set hand cursor for host or rollable");
        setHoverCursor("hand");
    elseif rollable2 or (gmrollable2 and User.isHost()) then
        local w = addBitmapWidget("field_rollable_transparent");
        --		w.setPosition("topright", 0, 2);
        --		w.sendToBack();
        Debug.console("Set hand cursor for rollable2");
        setHoverCursor("hand");
    end

    -- determine if node is static
    if window.getDatabaseNode().isStatic() then
        Debug.console("Remove visibility for static node");
        setVisible(false);
        return
    end

    -- set the hover cursor
    Debug.console("Set hover cursor");
    setHoverCursor("hand");

end

function onDoubleClick()
    --
    Debug.console("Double-click die roller");
    --
end
