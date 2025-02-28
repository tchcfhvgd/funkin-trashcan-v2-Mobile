function onCreate()
    makeLuaSprite('blackSquare', '', 0, 0)
    makeGraphic('blackSquare', 1280, 720, '000000')
    setObjectCamera('blackSquare', 'hud')
    screenCenter('blackSquare')
    addLuaSprite('blackSquare', true)
	setObjectOrder('blackSquare', 0)
end

function onSongStart()
    doTweenAlpha('hola3', 'blackSquare', 0, 6, 'linear')
end

function onStepHit()
    if curStep == 576 then
        setProperty('camZoomingMult', 0)
        setProperty('defaultCamZoom', 0.65)
    end

    if curStep == 591 then
        setProperty('defaultCamZoom', 0.6)
    end

    if curStep == 594 then
        setProperty('camZoomingMult', 1)
    end

    if curStep == 848 then
        setProperty('camZoomingMult', 0)
        setProperty('defaultCamZoom', 0.7)
        triggerEvent('Camera Follow Pos', 1280, 700)
    end

    if curStep == 864 then
        setObjectOrder('blackSquare', 100)
        doTweenAlpha('hola2', 'blackSquare', 1, 17, 'linear')
        doTweenZoom('hola', 'camGame', 0.55, 17, 'linear')
    end
end