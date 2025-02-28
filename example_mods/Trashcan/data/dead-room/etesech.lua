function onCreate()
    addCharacterToList('nagitogun', 'boyfriend')

	makeLuaSprite('blackSquare', '', 0, 0)
    makeGraphic('blackSquare', 1280, 720, '000000')
    setObjectCamera('blackSquare', 'hud')
    screenCenter('blackSquare')
    addLuaSprite('blackSquare', true)
	setObjectOrder('blackSquare', 100)
    setProperty('blackSquare.alpha', 0.00000001)

    startVideo('mierdito', false, true, false, false)
end

function onUpdate()
    if getProperty ('health') < 0.4 then
        setHealthBarColors('FFFFFF', 'ff239f')
    else
        setHealthBarColors('FFFFFF', '568c75')
    end
end

function onStepHit()
    if curStep == 864 then
        setProperty('defaultCamZoom', 0.7)
        doTweenAlpha('nagito', 'boyfriend', 0.00000001, 0.5, 'sineInOut')
    end

    if curStep == 880 then
        setProperty('pistola.alpha', 1)
        playAnim('pistola', 'spawn')
        triggerEvent('Change Character', 'bf', 'nagitogun')
    end

    if curStep == 896 then
        cameraFlash('game', 'FFFFFF', 1)
        setProperty('defaultCamZoom', 0.5)
        playAnim('pistola', 'nogun')
        setProperty('boyfriend.alpha', 1)
    end

    if curStep == 1600 then
        callMethod('videoCutscene.play')
    end

    if curStep == 1601 then
        setProperty('blackSquare.alpha', 1)
    end
end

function onPause()
    callMethod('videoCutscene.pause')
end

function onResume()
    callMethod('videoCutscene.resume')
end