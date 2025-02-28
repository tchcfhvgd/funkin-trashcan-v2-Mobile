local canSkip = false

function onCreate()
    makeAnimatedLuaSprite('space', 'other/space', 1000, 525)
    addAnimationByIndicesLoop('space', 'spaceidleig', 'space', '0,1', 12)
    addAnimationByPrefix('space', 'space', 'space', 24, false)
    addLuaSprite('space', false)
    scaleObject('space', 0.7, 0.7)
    setProperty('space.alpha', 0)
    setObjectCamera('space', 'hud')

    makeLuaText('side', 'You\nGo\nFirst', 0, 90, 80)
    setTextSize('side', 48)
    setTextFont('side', 'sk.ttf')
    setObjectCamera('side', 'game')
    setScrollFactor('side', 1, 1)
end

function onSongStart()
    canSkip = true

    doTweenAlpha('space', 'space', 0.35, 0.15, 'linear')
end

function onUpdate()
    if canSkip and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        playAnim('space', 'space')
        callMethod('setSongTime', {33500})
        doTweenAlpha('space', 'space', 0, 1, 'linear')
        setProperty('typewriterText.alpha', 0)
        setProperty('typewriterText2.alpha', 0)
        setProperty('typewriterText3.alpha', 0)
        setProperty('name.alpha', 0)
        setProperty('texto.alpha', 0)
        setProperty('dialogo.alpha', 0)
        cancelTimer('typeNextLetter')
        cancelTimer('typeNextLetter2')
        cancelTimer('typeNextLetter3')
        canSkip = false
        setVar('skipped', true)
    end
end

function onStepHit()
    if curStep == 160 then
        canSkip = false
        doTweenAlpha('space', 'space', 0, 1, 'linear')

        addLuaText('side')
    end

    if curStep == 240 then
        removeLuaText('side')
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('side.alpha', 0)
    end
    
    if curBeat % 4 == 0 then
        setProperty('side.alpha', 1)
    end
end
