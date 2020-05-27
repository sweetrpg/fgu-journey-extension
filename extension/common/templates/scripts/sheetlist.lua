function onSortCompare(w1, w2)
	if w1.name.getValue() == "" then
		return true;
	elseif w2.name.getValue() == "" then
		return false;
	end

	return w1.name.getValue() > w2.name.getValue();
end
