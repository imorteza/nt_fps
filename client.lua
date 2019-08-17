--[[
Thanks To siggyfawn
]]--

local prevframes, prevtime, curtime, curframes, fps = 0, 0, 0, 0, 0

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do
        Citizen.Wait(0)
        prevframes = GetFrameCount()
        prevtime = GetGameTimer()
    end

    while true do
        Citizen.Wait(0)
        curtime = GetGameTimer()
        curframes = GetFrameCount()

        if((curtime - prevtime) > 1000) then
            fps = (curframes - prevframes) - 1              
            prevtime = curtime
            prevframes = curframes
        end

        if fps > 0 and fps < 1000 then
            displayText("FPS: " .. fps, 0, 255, 255, 255, 255, 0.5, 0.0)
        end
    end
end)

function displayText(text, justification, red, green, blue, alpha, posx, posy)
    SetTextFont(4)
    SetTextWrap(0.0, 1.0)
    SetTextScale(1.0, 0.5)
    SetTextJustification(justification)
    SetTextColour(red, green, blue, alpha)
    SetTextOutline()

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(posx, posy)
end