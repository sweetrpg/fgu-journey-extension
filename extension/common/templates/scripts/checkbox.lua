local sourcelessvalue = false;

function setState(state)
	local datavalue = 1;

	if state == nil or state == false or state == 0 then
		datavalue = 0;
	end

	if source and not source.isStatic() then
		source.setValue(datavalue);
	else
		if datavalue == 0 then
			sourcelessvalue = false;
		else
			sourcelessvalue = true;
		end

		update();
	end
end

function update()
	if source then
		if source.getValue() ~= 0 then
			setIcon(stateicons[1].on[1]);
		else
			setIcon(stateicons[1].off[1]);
		end
	else
		if sourcelessvalue then
			setIcon(stateicons[1].on[1]);
		else
			setIcon(stateicons[1].off[1]);
		end
	end
	if self.onValueChanged then
		self.onValueChanged();
	end
end

function getState()
	if source then
		local datavalue = source.getValue();
		return datavalue ~= 0;
	else
		return sourcelessvalue;
	end
end

function onClickDown(button, x, y)
	self.setState(not getState());
end

function onInit()
	setIcon(stateicons[1].off[1]);

	if not sourceless and window.getDatabaseNode() then
		-- Get value from source node
		if sourcename then
			source = window.getDatabaseNode().createChild(sourcename[1], "number");
		else
			source = window.getDatabaseNode().createChild(getName(), "number");
		end
		if source then
			source.onUpdate = update;
			update();
		end
	else
		-- Use internal value, initialize to checked if <checked /> is specified
		if checked then
			sourcelessvalue = true;
			update();
		end
	end
end
