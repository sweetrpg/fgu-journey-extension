function onButtonPress()
	activate();
end

function activate()
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

	-- get the record node
	local recordnode = nil;
	if recordname then
		recordnode = node.getChild(recordname[1]);
	end
	if not recordnode then
		recordnode = node.getChild("recordname");
	end
	if not recordnode then
		recordnode = node;
	end
	
	-- open the window
	if classvalue and recordnode then
		Interface.openWindow(classvalue, recordnode);
	end
end
