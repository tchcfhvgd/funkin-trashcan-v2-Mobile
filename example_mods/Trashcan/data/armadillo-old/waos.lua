function onCountdownStarted()
    if middlescroll then
       return
    end
    for i = 0,3 do
        setPropertyFromGroup('playerStrums', i, 'x', _G['defaultOpponentStrumX'..i])
        setPropertyFromGroup('opponentStrums', i, 'x', _G['defaultPlayerStrumX'..i])
    end
end

function onUpdatePost(elapsed)
	if curStep == 118 then
		setProperty('defaultCamZoom', 0.9)
		triggerEvent('Camera Follow Pos', 585, 1460)
	end
	
	if curStep == 121 then
		setProperty('defaultCamZoom', 1.2)
		triggerEvent('Camera Follow Pos', 460, 1460)
	end
	
	if curStep == 518 then
		camera = false
		triggerEvent('Camera Follow Pos', 635, 1435)
	end
	
	if curStep == 582 then
		camera = true
		triggerEvent('Camera Follow Pos', 690, 1435)
	end
	
	if curStep == 1286 then
		camera = false
		triggerEvent('Camera Follow Pos', 635, 1435)
	end
	
	if curStep == 1350 then
		camera = true
	end
	
	if curStep == 518 or curStep == 1286 then
		doTweenZoom('timethework', 'camGame', 1.4, 16, 'quadIn')
	end
	
	if curStep == 582 or curStep == 1350 then
		cancelTween('timethework')
	end
end

function onSectionHit()
	if curSection == 8 then
		camera = true
	end

    if camera == true then
        if mustHitSection then
			setProperty('defaultCamZoom', 0.85)
			triggerEvent('Camera Follow Pos', 690, 1435)
        else
			setProperty('defaultCamZoom', 0.95)
			triggerEvent('Camera Follow Pos', 785, 1415)
        end
    end
end

-- Duerman a zozerkul