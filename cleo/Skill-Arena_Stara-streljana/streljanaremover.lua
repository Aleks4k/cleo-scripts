local sampev = require 'lib.samp.events'
local ev = require("samp.events")
local kurceza = 0

lua_thread.create(function()
    while true do
        wait(0)  
		for _, obj_hand in pairs(getAllObjects()) do
            local modelid = getObjectModel(obj_hand)
            if modelid == 1583 then
                if isObjectOnScreen(obj_hand) then
                    local x,y,z = getCharCoordinates(PLAYER_PED)
                    local res,x1,y1,z1 = getObjectCoordinates(obj_hand)
                    if res then
					    if kurceza == 0 then
						    kurceza = obj_hand
							tajmer = 6
						else
						    if tajmer == 0 then
							    setObjectCoordinates(kurceza, 0, 0, 0)
								kurceza = 0
							end
							tajmer = tajmer - 1
							wait (1000)
						end
                    end
                end
            end
        end
    end
end)
