labelwidget = nil;

function onInit()
	if label then
		labelwidget = addTextWidget("sheetlabelinline", label[1]);
		local w,h = labelwidget.getSize();
		labelwidget.setPosition("bottomleft", w/2, h/2-4);
	end
end
