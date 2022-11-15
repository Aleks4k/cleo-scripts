local ev = require('samp.events')

function ev.onShowDialog(id, style, title, button1, button2, text)
    if title:find('Verifikacija') then 
	local koji = 0
    local prvibroj = 0
    local drugibroj = 0
    local trecibroj = 0
	for a = 2070, 2150	do --cycle trough all textdeaw id 2139 je pocetak.
				if sampTextdrawIsExists(a) then --if textdeaw exists then
					x, y = sampTextdrawGetPos(a) --we get it's position. value returns in game coords
					koji = koji + 1
				    letSizeX, letSizeY, color = sampTextdrawGetLetterSizeAndColor(a)
					if x >= 269 and x < 290 and color == 4278190080 then
					    prvibroj = prvibroj + 1
					end
					if x >= 306 and x < 327 and color == 4278190080 then
					    drugibroj = drugibroj + 1
					end
					if x >= 343 and x < 364 and color == 4278190080 then
					    trecibroj = trecibroj + 1
					end
				end  
	end
	sampAddChatMessage(string.format("%d %d %d", prvibroj, drugibroj, trecibroj), 0x00DD00)
	unesiga(id, prvibroj, drugibroj, trecibroj)
end
end

function unesiga(id, prvibroj, drugibroj, trecibroj)
    lua_thread.create(function ()
			wait(3000)
			sampSendDialogResponse(id, 1, -1, string.format("%d%d%d", prvibroj, drugibroj, trecibroj))
			sampCloseCurrentDialogWithButton(0)
		end)
end
	