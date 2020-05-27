local sourcenode = nil;
local updating = false;

function onInit()
	sourcenode = getDatabaseNode();
	if sourcenode then
		if sourcenode.isStatic() then
			--setEnabled(false);
			setReadOnly(true);
		end
	end
end

function onClose()
	update();
end

function update()
	if not updating then
		if sourcenode and sourcenode.isOwner() and not sourcenode.isStatic() then
		
			-- set the updating flag
			updating = true;
	
			-- get the source node value
			local oldvalue = sourcenode.getValue();
			local newvalue = oldvalue;
			
			-- perform symbol replacements
			newvalue = string.gsub(newvalue, "%(S%)", "&#255;"); -- #255 - (S) - Success
			newvalue = string.gsub(newvalue, "%(!%)", "&#254;"); -- #254 - (!) - Triumph
			newvalue = string.gsub(newvalue, "%(F%)", "&#253;"); -- #253 - (F) - Failure
			newvalue = string.gsub(newvalue, "%(T%)", "&#252;"); -- #252 - (T) - Threat
			newvalue = string.gsub(newvalue, "%(A+%)", "&#251;"); -- #251 - (A) - Advantage
			newvalue = string.gsub(newvalue, "%(D%)", "&#250;"); -- #250 - (D) - Despair
			newvalue = string.gsub(newvalue, "%(%-%)", "&#249;"); -- #249 - (-) - Darkside Force
			newvalue = string.gsub(newvalue, "%(%+%)", "&#248;"); -- #248 - (+) - Lightside Force

			
			-- perform dice replacements
			newvalue = string.gsub(newvalue, "%[F%]", "&#247;"); -- #247 - [F] - force die			
			newvalue = string.gsub(newvalue, "%[A%]", "&#246;"); -- #246 - [A] - ability die
			newvalue = string.gsub(newvalue, "%[D%]", "&#245;"); -- #245 - [D] - difficulty die
			newvalue = string.gsub(newvalue, "%[P%]", "&#244;"); -- #244 - [P] - proficiency die
			newvalue = string.gsub(newvalue, "%[C%]", "&#243;"); -- #243 - [C] - challenge
			newvalue = string.gsub(newvalue, "%[B%]", "&#242;"); -- #242 - [B] - boost
			newvalue = string.gsub(newvalue, "%[S%]", "&#241;"); -- #241 - [S] - setback
			--newvalue = string.gsub(newvalue, "%[E%]", "&#240;"); -- #240 - [E] - expertise
			
			-- perform symbol replacements
			--newvalue = string.gsub(newvalue, "%(S%)", "&#255;"); -- #255 - (S) - success
			--newvalue = string.gsub(newvalue, "%(R%)", "&#254;"); -- #254 - (R) - righteous success
			--newvalue = string.gsub(newvalue, "%(X%)", "&#253;"); -- #253 - (X) - challenge
			--newvalue = string.gsub(newvalue, "%(%-%)", "&#252;"); -- #252 - (-) - bane
			--newvalue = string.gsub(newvalue, "%(%+%)", "&#251;"); -- #251 - (+) - boon
			--newvalue = string.gsub(newvalue, "%(%*%)", "&#250;"); -- #250 - (*) - chaos star
			--newvalue = string.gsub(newvalue, "%(D%)", "&#249;"); -- #249 - (D) - delay
			--newvalue = string.gsub(newvalue, "%(E%)", "&#248;"); -- #248 - (E) - exertion
			--newvalue = string.gsub(newvalue, "%(C%)", "&#247;"); -- #247 - (C) - sigmars comet
			
			-- perform dice replacements
			--newvalue = string.gsub(newvalue, "%[C%]", "&#246;"); -- #246 - [C] - characteristic
			--newvalue = string.gsub(newvalue, "%[X%]", "&#245;"); -- #245 - [X] - challenge
			--newvalue = string.gsub(newvalue, "%[R%]", "&#244;"); -- #244 - [R] - reckless
			--newvalue = string.gsub(newvalue, "%[G%]", "&#243;"); -- #243 - [G] - conservative
			--newvalue = string.gsub(newvalue, "%[F%]", "&#242;"); -- #242 - [F] - fortune
			--newvalue = string.gsub(newvalue, "%[M%]", "&#241;"); -- #241 - [M] - misfortune
			--newvalue = string.gsub(newvalue, "%[E%]", "&#240;"); -- #240 - [E] - expertise			
		
			-- set the source node value
			if newvalue ~= oldvalue then
				sourcenode.setValue(newvalue);
			end
			
			-- clear the update flag
			updating = false;
			
		end
	end
end