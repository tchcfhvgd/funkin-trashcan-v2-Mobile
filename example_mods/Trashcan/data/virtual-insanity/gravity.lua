function onCreate()
    addCharacterToList('pucci2', 'dad')
    addCharacterToList('weather2atlas', 'boyfriend')

    makeLuaSprite('fondofondo', 'stages/jojo/fondofondo', 0, -600)
    addLuaSprite('fondofondo', false)

    makeAnimatedLuaSprite('franjas', 'stages/jojo/franjas', 0, -625)
    addAnimationByPrefix('franjas', 'franjas', 'Símbolo 2', 24, true)
    addLuaSprite('franjas', false)
    scaleObject('franjas', 1.5, 1.5)

    makeLuaSprite('raya', 'stages/jojo/cosas q van encima de las rayas', 0, -600)
    addLuaSprite('raya', false)

    makeLuaSprite('fondopiso', 'stages/jojo/fondo piso', -275, 0)
    addLuaSprite('fondopiso', false)

    makeAnimatedLuaSprite('anasui2', 'stages/jojo/anasui2', 25, 70)
    addAnimationByPrefix('anasui2', 'anasui2', 'anasui', 24, false)
    addLuaSprite('anasui2', true)
    scaleObject('anasui2', 0.8, 0.8)

    makeLuaSprite('mamada', 'stages/jojo/esta mamada que', 0, 0)
    addLuaSprite('mamada', true)
    setObjectCamera('mamada', 'hud')
    setObjectOrder('mamada', 1)
    setBlendMode('mamada', 'multiply')

    makeLuaSprite('blackSquare', '', 0, 0)
    makeGraphic('blackSquare', 1280, 720, '000000')
    setObjectCamera('blackSquare', 'hud')
    screenCenter('blackSquare')
    setObjectOrder('blackSquare', 10)

    setObjectOrder('gfGroup', getObjectOrder('boyfriendGroup') + 1)

    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('healthBar.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('scoreTxt.visible', false)

    setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', true)
end

function onCreatePost()
    runHaxeCode([[
        game.healthBar.bg.loadGraphic(Paths.image('stages/jojo/hpbar'));
        game.healthBar.leftBar.loadGraphic(Paths.image('stages/jojo/hpbarbg'));
        game.healthBar.rightBar.loadGraphic(Paths.image('stages/jojo/hpbarbg'));
        game.healthBar.barWidth = Std.int(620);
        game.healthBar.barHeight = Std.int(game.healthBar.bg.height);
    ]])

    screenCenter('healthBar', 'x')
    setProperty('healthBar.barOffset.x', getProperty('healthBar.barOffset.x') + 50)
    setProperty('healthBar.y', getProperty('iconP2.y') + 42)
end

function onStepHit()
    if curStep == 226 then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
            setPropertyFromGroup('strumLineNotes', i, 'visible', true)
        end

        if middlescroll then
            for i = 0,3 do
                noteTweenAlpha(i, i, 0.35, 2, 'sineInOut')
            end

            for i = 4,7 do
                noteTweenAlpha(i, i, 1, 2, 'sineInOut')
            end
        else
            for i = 0,7 do
                noteTweenAlpha(i, i, 1, 2, 'sineInOut')
            end
        end

        if middlescroll then
            setProperty('timeBar.alpha', 0)
            setProperty('timeTxt.alpha', 0)

            setProperty('timeBar.visible', true)
            setProperty('timeTxt.visible', true)

            doTweenAlpha('timeBar', 'timeBar', 1, 2, 'sineInOut')
            doTweenAlpha('timeTxt', 'timeTxt', 1, 2, 'sineInOut')
        end
    
        setProperty('healthBar.alpha', 0)
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
        setProperty('scoreTxt.alpha', 0)

        setProperty('healthBar.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('scoreTxt.visible', true)

        doTweenAlpha('healthBar', 'healthBar', 1, 2, 'sineInOut')
        doTweenAlpha('iconP1', 'iconP1', 1, 2, 'sineInOut')
        doTweenAlpha('iconP2', 'iconP2', 1, 2, 'sineInOut')
        doTweenAlpha('scoreTxt', 'scoreTxt', 1, 2, 'sineInOut')
        
        if timeBarType ~= 'Disabled' then
            if not middlescroll then
                doTweenAlpha('TimeSprite', 'TimeSprite', 1, 2, 'sineInOut')
                doTweenAlpha('SecondsText', 'SecondsText', 1, 2, 'sineInOut')
                doTweenAlpha('TenSecondsText', 'TenSecondsText', 1, 2, 'sineInOut')
                doTweenAlpha('HundredSecondsText', 'HundredSecondsText', 1, 2, 'sineInOut')
            end
        end

        setProperty('fondofondo.alpha', 0)
        setProperty('franjas.alpha', 0)
        setProperty('raya.alpha', 0)
        setProperty('fondopiso.alpha', 0)
        setProperty('anasui2.alpha', 0)
        setProperty('mamada.alpha', 0)

        setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', ghostTapping)
    end

    if curStep == 256 then
        cameraFlash('hud', 'FFFFFF', 0.5)
        removeLuaSprite('mangabujo 1')
        removeLuaSprite('marcobujo')
        removeLuaSprite('pucci rayo gay')
        removeLuaSprite('anasui caracol')
        removeLuaSprite('weather pierna')
        setProperty('wezaripoto.flipX', false)
        setProperty('wezaripoto.x', 1300)
        removeLuaSprite('blackSquare')
    end

    if curStep == 1836 then
        removeLuaSprite('wezaripoto')
        cameraFlash('hud', 'FFFFFF', 0.5)
        doTweenY('lineastween', 'lineas', -10, 1, 'quintOut')
        doTweenY('hotlinetween', 'hotline', 630, 1, 'quintOut')

        setProperty('fondofondo.alpha', 1)
        setProperty('franjas.alpha', 1)
        setProperty('raya.alpha', 1)
        setProperty('fondopiso.alpha', 1)
        setProperty('anasui2.alpha', 1)
        setProperty('mamada.alpha', 1)

        setProperty('caracolFg.alpha', 0)
        setProperty('luzArcoiris.alpha', 0)
    end

    if curStep == 2092 then
        cameraFlash('game', 'FFFFFF', 0.5)
        doTweenY('lineastween', 'lineas', -45, 1, 'quintOut')
        doTweenY('hotlinetween', 'hotline', 665, 1, 'quintOut')
        doTweenX('guitarra', 'gf', 1350, 1, 'quintOut')
        
        removeLuaSprite('fondofondo', true)
        removeLuaSprite('franjas', true)
        removeLuaSprite('raya', true)
        removeLuaSprite('fondopiso', true)
        removeLuaSprite('mamada', true)
        removeLuaSprite('anasui2', true)
    
        setProperty('caracolFg.alpha', 1)
        setProperty('luzArcoiris.alpha', 1)
    end
end

function onDestroy()
    setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', ghostTapping)
end

function onBeatHit()
	if curBeat % 2 == 0 then
        playAnim('anasui2', 'anasui2', false, false, 0)
	end
end

function onSectionHit()
    if mustHitSection then
        setProperty('defaultCamZoom', 0.7)
    else
        setProperty('defaultCamZoom', 0.9)
    end
end

function goodNoteHit(i, d, t, s)
    if t == '' then
        if s then
            playAnim('boyfriend', getProperty('singAnimations')[d+1]..'-hold', true)
        end
    end
end
