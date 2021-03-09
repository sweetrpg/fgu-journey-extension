--
function onInit()

    aRecords = {
        ["srpg_journey"] = {
            -- bNoCategories = true,
            bExport = true,
            sEditMode = "gm",
            aDataMap = {"srpg_journey", "reference.srpg_journey"},
            aDisplayIcon = {"button_journeys_up", "button_journeys_down"},
            sRecordDisplayClass = "srpg_journey"
        }
    };

    for kRecordType, vRecordType in pairs(aRecords) do
        LibraryData.setRecordTypeInfo(kRecordType, vRecordType);
    end
end
