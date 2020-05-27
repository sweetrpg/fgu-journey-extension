local updating = false;

function onInit()
	onValueChanged();
end

function onValueChanged()
	if not updating then
		updating = true;
		local value = getValue();
		if minvalue then
			if tonumber(minvalue[1]) > value then
				value = tonumber(minvalue[1]);
				setValue(value);
			end
		end
		if maxvalue then
			if value > tonumber(maxvalue[1]) then
				value = tonumber(maxvalue[1]);
				setValue(value);
			end
		end
		if value == 0 then
			if zerocolor then
				setColor(zerocolor[1]);
			end
		else
			if color then
				setColor(color[1]);
			end
		end
		updating = false;
	end
end
