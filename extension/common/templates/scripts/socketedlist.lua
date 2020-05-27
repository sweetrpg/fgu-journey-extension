function onSortCompare(w1, w2)
	if w1.name.getValue() == "" then
		return true;
	elseif w2.name.getValue() == "" then
		return false;
	end

	return w1.name.getValue() > w2.name.getValue();
end

function onFilter(w)
	local windownode = w.getDatabaseNode();
	local socketednode = windownode.getChild("socketed");
	if socketednode then
		if socketednode.getValue() == 1 then
			return false;
		end
	end
	return true;
end