local lineasclutch = false

function onCreate()
    addCharacterToList('godot2atlas', 'boyfriend')
    addCharacterToList('dahliaatlas', 'dad')

    setObjectOrder('gfGroup', 3)

    makeLuaSprite('blackSquare', '', 0, 0)
    makeGraphic('blackSquare', 1280, 720, '000000')
    setObjectCamera('blackSquare', 'hud')
    addLuaSprite('blackSquare', true)
    setObjectOrder('blackSquare', 10)
    setProperty('blackSquare.alpha', 0)

    if checkFileExists('data/'..songPath..'/SPOILER.txt') then
        lineasclutch = true
    end
end

function onSongStart()
    if lineasclutch then
        makeLuaSprite('lineas2', '', 0, -30)
        makeGraphic('lineas2', 1280, 100, '000000')
        addLuaSprite('lineas2', true)
        setScrollFactor('lineas2', 0, 0)
        setObjectCamera('lineas2', 'hud')
        setObjectOrder('lineas2', 10)
        setProperty('lineas2.alpha', 0)
    end
end

function onBeatHit()
    if curBeat == 336 then
        setProperty('blackSquare.alpha', 1)

        runHaxeCode([[
            game.healthBar.leftBar.loadGraphic(Paths.image('stages/bridge/uncanny'));
            game.healthBar.rightBar.loadGraphic(Paths.image('stages/bridge/uncanny'));
        ]])

        setHealthBarColors('424242', '424242')
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
    end

    if curBeat == 340 then
        setProperty('gf.alpha', 0)
        setCharacterX('boyfriend', 1450)
        setCharacterY('boyfriend', 400)
        setCharacterX('dad', 570)
        setCharacterY('dad', 520)

        setProperty('defaultCamZoom', 0.6)
        setProperty('cameraSpeed', 1)
        setProperty('boyfriendCameraOffset[0]', 0)
        setProperty('boyfriendCameraOffset[1]', 0)
        setProperty('opponentCameraOffset[0]', 0)
        setProperty('opponentCameraOffset[1]', 0)

        setProperty('back.alpha', 0)
        setProperty('piso.alpha', 0)
        setProperty('podium.alpha', 0)
        setProperty('audience.alpha', 0)
        setProperty('povForeground.alpha', 0)
        setProperty('maya.alpha', 0)
        setProperty('overlay.alpha', 0)
        setProperty('overlay2.alpha', 0)

        setProperty('fondo2.alpha', 1)
        setProperty('niebla.alpha', 1)
        setProperty('overlay3.alpha', 1)

        if lineasclutch then
            setProperty('lineas2.alpha', 1)
        end
    end

    if curBeat == 420 then
        setProperty('blackSquare.alpha', 1)

        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)

        setProperty('gf.alpha', 1)
        setCharacterX('boyfriend', 1858)
        setCharacterY('boyfriend', 480)
        setCharacterX('dad', 18)
        setCharacterY('dad', 480)

        setProperty('defaultCamZoom', 0.65)
        setProperty('cameraSpeed', 10000)
        setProperty('boyfriendCameraOffset[0]', -240)
        setProperty('boyfriendCameraOffset[1]', 78)
        setProperty('opponentCameraOffset[0]', 185)
        setProperty('opponentCameraOffset[1]', 105)

        setProperty('back.alpha', 1)
        setProperty('piso.alpha', 1)
        setProperty('podium.alpha', 1)
        setProperty('audience.alpha', 1)
        setProperty('povForeground.alpha', 1)
        setProperty('maya.alpha', 1)
        setProperty('overlay.alpha', 1)
        setProperty('overlay2.alpha', 1)

        setProperty('fondo2.alpha', 0)
        setProperty('niebla.alpha', 0)
        setProperty('overlay3.alpha', 0)

        if lineasclutch then
            setProperty('lineas2.alpha', 0)
        end
    end

    if curBeat == 422 then
        triggerEvent('Change Character', 'dad', 'godotatlas')
        triggerEvent('Change Character', 'bf', 'phoenixatlas')

        setHealthBarColors('424242', '424242')
    end

    if curBeat == 424 then
        runHaxeCode([[
            game.healthBar.leftBar.loadGraphic(Paths.image('stages/bridge/godom'));
            game.healthBar.rightBar.loadGraphic(Paths.image('stages/bridge/wrig'));
        ]])

        setHealthBarColors('008383', '294A8D')
        setProperty('iconP1.alpha', 1)
        setProperty('iconP2.alpha', 1)

        doTweenAlpha('joder', 'blackSquare', 0, 5, 'sineOut')
    end

    if curBeat == 426 then
        setProperty('cameraSpeed', 5)
    end
end

function onCreatePost()
    initLuaShader('woouw')
    setSpriteShader('fondo2','woouw')
end

function onUpdatePost(elapsed)
    setShaderFloat('fondo2', 'iTime', os.clock())
end

function onEvent(eventName, value1, value2, strumTime)
    if eventName == 'Apoco' then
        doTweenAlpha('Apoco', 'blackSquare', 0.5, 0.06, 'sineOut')
        doTweenAlpha('ApocoPe1', 'iconP1', 0.5, 0.06, 'sineOut')
        doTweenAlpha('ApocoPe2', 'iconP2', 0.5, 0.06, 'sineOut')
    end
end

function onTweenCompleted(tag, vars)
    if tag == 'Apoco' then
        doTweenAlpha('blackSquare', 'blackSquare', 1, 0.1, 'sineInOut')
        doTweenAlpha('ApocoP1', 'iconP1', 0, 0.1, 'sineOut')
        doTweenAlpha('ApocoP2', 'iconP2', 0, 0.1, 'sineOut')
    end

    if tag == 'ApocoP1' then
        setProperty('blackSquare.alpha', 0)
        setProperty('iconP1.alpha', 1)
        setProperty('iconP2.alpha', 1)
    end
end
