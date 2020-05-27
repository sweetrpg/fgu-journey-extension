function onValueChanged()
	local value = getValue();
	if value == 0 then
		setColor(zerocolor[1]);
	else
		setColor(color[1]);
	end
	if minvalue then
		if tonumber(minvalue[1]) > value then
			setValue(tonumber(minvalue[1]));
		end
	end
	if maxvalue then
		if value > tonumber(maxvalue[1]) then
			setValue(tonumber(maxvalue[1]));
		end
	end
end

function onInit()
	onValueChanged();
end
