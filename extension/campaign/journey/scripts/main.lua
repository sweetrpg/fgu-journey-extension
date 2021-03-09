--
-- Please see the license.html file included with this distribution for
-- attribution and copyright information.
--
function onInit() update(); end

function VisDataCleared() update(); end

function InvisDataAdded() update(); end

function updateControl(sControl, bReadOnly, bID)
    if not self[sControl] then return false; end

    if not bID then return self[sControl].update(bReadOnly, true); end

    return self[sControl].update(bReadOnly);
end

function update()
    local nodeRecord = getDatabaseNode();
    local bReadOnly = WindowManager.getReadOnlyState(nodeRecord);
end
