local updating = false;

function onInit()
	onValueChanged();
end

-- MOD: Added to only allow editing of number controls with mouse wheel if CTRL pressed - this prevents unwanted editing when scrolling with the mouse wheel
function onWheel(notches)
	if not Input.isControlPressed() then
		-- Do not allow editing with mouse wheel unless CTRL is pressed
		return false;
	end

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