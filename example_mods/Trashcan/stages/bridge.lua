function onCreate()
        makeLuaSprite('back', 'stages/bridge/back', 0, 0)
        addLuaSprite('back', false)

        makeLuaSprite('piso', 'stages/bridge/floor', 0, 0)
        addLuaSprite('piso', false)

        makeLuaSprite('podium', 'stages/bridge/podium', 0, 0)
        addLuaSprite('podium', false)

        makeLuaSprite('audience', 'stages/bridge/audienceThing', 0, 0)
        addLuaSprite('audience', false)

        makeLuaSprite('povForeground', 'stages/bridge/povForeground', 0, 0)
        addLuaSprite('povForeground', true)

        makeAnimatedLuaSprite('maya', 'stages/bridge/maya', 875, 450)
        addAnimationByPrefix('maya', 'maya', 'Maya', 24, false)
        addLuaSprite('maya', true)

        makeLuaSprite('overlay', 'stages/bridge/overlayLightAdd', 0, 0)
        addLuaSprite('overlay', true)
        setBlendMode('overlay', 'overlay')
        setProperty('overlay1.alpha', 0.7)

        makeLuaSprite('overlay2', 'stages/bridge/overlayLightAdd2', 0, 0)
        addLuaSprite('overlay2', true)
        setBlendMode('overlay2', 'overlay')
        setProperty('overlay2.alpha', 0.7)

        --Second BG waos

        makeLuaSprite('fondo2', 'stages/bridge/fondo2', 100, 0)
        addLuaSprite('fondo2', false)
        setProperty('fondo2.alpha', 0)

        makeLuaSprite('niebla', 'stages/bridge/niebl', 20, 700)
        addLuaSprite('niebla', false)
        setProperty('niebla.alpha', 0)

        makeLuaSprite('overlay3', 'stages/bridge/overlay', 0, 0)
        setObjectCamera('overlay3', 'hud')
	setObjectOrder('overlay3', 1)
        setBlendMode('overlay3', 'overlay')
        setProperty('overlay3.alpha', 0)

        setObjectOrder('niebla', getObjectOrder('boyfriendGroup') + 1)
        setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 2)
        setObjectOrder('gfGroup', 1)

	makeLuaSprite('lineas', '', 0, -30)
        makeGraphic('lineas', 1280, 100, '000000')
        addLuaSprite('lineas', true)
	setScrollFactor('lineas', 0, 0)
        setObjectCamera('lineas', 'hud')
        setObjectOrder('lineas', 10)

	makeLuaSprite('hotline', '', 0, 650)
        makeGraphic('hotline', 1280, 100, '000000')
        addLuaSprite('hotline', true)
	setScrollFactor('hotline', 0, 0)
        setObjectCamera('hotline', 'hud')
        setObjectOrder('hotline', 10)
end

function onBeatHit()
        if curBeat % 2 == 0 then
                playAnim('maya', 'maya', false, false, 0)
        end
end

function onCountdownTick(counter)
        if counter % 2 == 0 then
                playAnim('maya', 'maya', false, false, 0)
        end
end