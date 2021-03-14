local dragging = false;

function onInit()
    if rollable or (gmrollable and User.isHost()) then
        local w = addBitmapWidget("field_rollable");
        --		w.setPosition("bottomleft", -1, -4);
        setHoverCursor("hand");
    elseif rollable2 or (gmrollable2 and User.isHost()) then
        local w = addBitmapWidget("field_rollable_transparent");
        --		w.setPosition("topright", 0, 2);
        --		w.sendToBack();
        setHoverCursor("hand");
    end

    -- determine if node is static
    if window.getDatabaseNode().isStatic() then
        setVisible(false);
        return
    end

    -- set the hover cursor
    setHoverCursor("hand");

end

function onDoubleClick()
    --
    Debug.console("Double-click die roller");
    --
end
