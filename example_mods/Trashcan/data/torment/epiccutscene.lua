function onCreate()
    precacheImage('stages/torment/specterfinal')
    precacheImage('stages/torment/shovelfinal')

	makeLuaSprite('colors', '', 0, 0)
    makeGraphic('colors', 1280, 720, '')
    addLuaSprite('colors', true)
    setProperty('colors.alpha', 0)
    setObjectCamera('colors', 'hud')
    setObjectOrder('colors', 50)
    screenCenter('colors')

    makeLuaSprite('white', '', 0, 0)
    makeGraphic('white', 1280, 720, '')
    addLuaSprite('white', true)
    setProperty('white.alpha', 0)
    setObjectCamera('white', 'other')
    screenCenter('white')
end

function onStepHit()
    if curStep == 1840 then
        cameraFlash('game', 'FFFFFF', 1)
        setProperty('boyfriend.color', 0x000000)
        setProperty('dad.color', 0x000000)
        setProperty('plataformas.color', 0x000000)
        setProperty('piso.color', 0x000000)
        setProperty('defaultCamZoom', 0.7)
    end

    if curStep == 2096 then
        cameraFlash('game', 'FFFFFF', 1)
        setProperty('boyfriend.color', 0xFFFFFF)
        setProperty('dad.color', 0xFFFFFF)
        setProperty('plataformas.color', 0xFFFFFF)
        setProperty('piso.color', 0xFFFFFF)
        setProperty('defaultCamZoom', 0.6)
    end

    if curStep == 2608 then
        setProperty('camZoomingMult', 0)

        setProperty('colors.alpha', 1)
        setProperty('white.alpha', 0.95)
        doTweenAlpha('white', 'white', 0, 0.5, 'linear')

        makeAnimatedLuaSprite('specter', 'stages/torment/specterfinal', 52, 48)
        addAnimationByPrefix('specter', 'final', 'Simbolo 2 instancia 1', 30, false)
        addLuaSprite('specter', true)
        setObjectCamera('specter', 'hud')
        setObjectOrder('specter', 51)

        makeLuaSprite('shovel', 'stages/torment/shovelfinal', 190, 190)
        addLuaSprite('shovel', true)
        setObjectCamera('shovel', 'hud')
        setObjectOrder('shovel', 52)

        doTweenX('specter', 'specter', 206, 5, 'linear')
        doTweenX('shovel', 'shovel', -23, 5, 'linear')
    end

    if curStep == 2615 then
        setProperty('colors.color', 0xFF0000)
    end

    if curStep == 2622 then
        setProperty('colors.color', 0x959500)
    end

    if curStep == 2629 then
        setProperty('colors.color', 0xFF00CC)
    end

    if curStep == 2636 then
        setProperty('colors.color', 0x660000)
    end

    if curStep == 2643 then
        setProperty('colors.color', 0xCCCCFF)
    end

    if curStep == 2650 then
        setProperty('colors.color', 0xFFFFFF)
    end

    if curStep == 2656 then
        setProperty('camHUD.visible', false)
        triggerEvent('Play Animation', 'Muerto', 'dad')
    end

    if curStep == 2662 then
        triggerEvent('Play Animation', 'loopMuerto', 'dad')
    end

    if curStep == 2668 then
        triggerEvent('Play Animation', 'Win', 'bf')
    end
end