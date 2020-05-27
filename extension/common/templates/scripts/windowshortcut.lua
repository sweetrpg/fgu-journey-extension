local dragging = false;

function onDragStart(button, x, y, draginfo)
	dragging = false;
	return onDrag(button, x, y, draginfo);
end

function onDrag(button, x, y, draginfo)
	if not dragging then
		local node = window.getDatabaseNode();
		
		-- get the class value
		local classvalue = nil;
		if class then
			classvalue = class[1];
		else
			local classnode = node.getChild("classname");
			if classnode then
				classvalue = classnode.getValue();
			end
		end
		
		-- get the record value
		local recordvalue = nil;
		local recordnode = nil;
		if recordname then
			recordnode = node.getChild(recordname[1]);
		end
		if not recordnode then
			recordnode = node.getChild("recordname");
		end
		if recordnode then
			recordvalue = recordnode.getNodeName();
		else
			recordvalue = node.getNodeName();
		end
		
		-- get the name value
		local namevalue = nil;
		local namenode = node.getChild("name");
		if namenode then
			namevalue = namenode.getValue();
		end

		-- create the shortcut
		if classvalue and recordvalue then
			draginfo.setShortcutData(classvalue, recordvalue);
			if namevalue then
				draginfo.setDescription(namevalue);
			end
			draginfo.setType("shortcut");
			draginfo.setIcon("button_openwindow");
			dragging = true;
		end
	end
	return true;
end

function onDragEnd(draginfo)
	dragging = false;
end

function onInit()
	setHoverCursor("hand");
end
