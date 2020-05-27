function onInit()
	-- Debug.chat("static",static);
	if static then
		local staticvalue = LanguageManager.getString(static[1]);
		if staticcase then
			if string.lower(staticcase[1]) == "upper" then
				staticvalue = string.upper(staticvalue);
			else
				staticvalue = string.lower(staticvalue);
			end
		end
		setReadOnly(false);
		setValue(staticvalue);
		setReadOnly(true);
	end
end
