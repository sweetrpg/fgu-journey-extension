labelwidget = nil;

function onInit()
--	Debug.chat("label",name);
	super.onInit();
	if label then
		labelwidget = addTextWidget("sheetlabelinline", string.upper(label[1]));
		local w,h = labelwidget.getSize();
		labelwidget.setPosition("bottomleft", w/2+1, h/2);
	end

end
