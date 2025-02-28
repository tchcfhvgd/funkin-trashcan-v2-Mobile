function onCreate()
    makeAnimatedLuaSprite('onda', 'stages/sirenhead/onda', -550, 20)
	addAnimationByPrefix('onda', 'start', 'onda start', 24, false)
    addAnimationByPrefix('onda', 'loop', 'loop onda', 24, true)
    addOffset('onda', 'start', 0, 0)
    addOffset('onda', 'loop', 204, 196)
    addLuaSprite('onda', false)
    setProperty('onda.alpha', 0.0000000000001)
end

function onStepHit()
    if curStep == 1136 then
        setProperty('defaultCamZoom', 0.9)
        triggerEvent('Camera Follow Pos', 100, 390)
    end

    if curStep == 1163 then
        cameraShake('game', 0.01, 7)
        runHaxeCode('FlxTween.tween(game.camGame, {_fxShakeIntensity: 0.001}, 7 / game.playbackRate, {ease: FlxEase.linear});')
        triggerEvent('Play Animation', 'scream', 'dad')
        setProperty('onda.alpha', 1)
        playAnim('onda', 'start')
    end

    if curStep == 1232 then
        triggerEvent('Camera Follow Pos', '', '')
        setProperty('defaultCamZoom', 0.8)
        triggerEvent('Play Animation', 'idle', 'dad')
        doTweenAlpha('onda', 'onda', 0, 1, 'linear')
    end

    if curStep == 1424 then
        setProperty('defaultCamZoom', 0.85)
        doTweenAlpha('overlay', 'overlay', 0, 1, 'linear')
        doTweenAlpha('bordes', 'bordes', 1, 1, 'linear')
    end

    if curStep == 1680 then
        setProperty('defaultCamZoom', 0.8)
        cameraFlash('game', 'FFFFFF', 1)
        setProperty('overlay.alpha', 1)
        setProperty('bordes.alpha', 0)
    end

    if curStep == 2198 then
        triggerEvent('Play Animation', 'death', 'dad')
    end
end

function onUpdate()
    if getProperty('onda.animation.finished') and getProperty('onda.animation.name') == 'start' then
        playAnim('onda', 'loop')
    end

    if getProperty('dad.animation.finished') and getProperty('dad.animation.name') == 'death' then
        triggerEvent('Play Animation', 'death-loop', 'dad')
    end
end