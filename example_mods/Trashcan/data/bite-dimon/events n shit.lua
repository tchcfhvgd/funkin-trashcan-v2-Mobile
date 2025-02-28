local savedPos = {}
local newPos = {
    -390,  --rating X coordinate
    -240,  --rating Y coordinate
    -310,  --combo X coordinate
    -240   --combo Y coordinate
}

function onCreate()
    if difficultyName == 'Normal' then
        apoco = true
        savedPos = getPropertyFromClass('backend.ClientPrefs', 'data.comboOffset')
        for i = 1,4 do
            setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset['..(i-1)..']', newPos[i])
        end

        setProperty('dad.alpha', 0)
        setProperty('iconP2.alpha', 0)

        addCharacterToList('sonic dimon', 'dad')
        addCharacterToList('coolrashintro', 'dad')
        addCharacterToList('coolrash', 'dad')
        addCharacterToList('crash', 'dad')
        addCharacterToList('mickey', 'dad')
        addCharacterToList('woody', 'dad')

        --Coolrash stage

        makeLuaSprite('coolrash stage', 'stages/dimon/coolrash stage', -525, -95)
        addLuaSprite('coolrash stage', false)
        setObjectOrder('coolrash stage', 0)

        makeLuaSprite('coolrash border', 'stages/dimon/coolrash border', -525, -95)
        addLuaSprite('coolrash border', false)
        setBlendMode('coolrash border', 'multiply')
        setObjectOrder('coolrash border', 0)
        
        --Mickey stage

        makeLuaSprite('jumpscare', 'stages/dimon/hola', -1095, -415)
        addLuaSprite('jumpscare', false)
        setObjectOrder('jumpscare', 0)

        makeLuaSprite('fondo', 'stages/dimon/fondo', -525, -95)
        addLuaSprite('fondo', false)
        scaleObject('fondo', 0.5547, 0.5547)
        setObjectOrder('fondo', 0)
        
        makeLuaSprite('paredes', 'stages/dimon/paredes', -590, -93.5)
        addLuaSprite('paredes', false)
        scaleObject('paredes', 0.6, 0.6)
        setObjectOrder('paredes', 0)
    
        makeLuaSprite('edificios', 'stages/dimon/edificios', -590, -90)
        addLuaSprite('edificios', false)
        scaleObject('edificios', 0.6, 0.6)
        setObjectOrder('edificios', 0)
    
        makeLuaSprite('plataforma', 'stages/dimon/plataforma', -980, -340.5)
        addLuaSprite('plataforma', false)
        scaleObject('plataforma', 0.9, 0.9)
        setObjectOrder('plataforma', 0)

        makeLuaSprite('bordes miki', 'stages/dimon/bordes miki', -525, -95)
        addLuaSprite('bordes miki', false)
        scaleObject('bordes miki', 0.5547, 0.5547)
        setBlendMode('bordes miki', 'multiply')
        setObjectOrder('bordes miki', 0)

        --Crash stage

        makeLuaSprite('pared', 'stages/dimon/pared', -550, -135)
        addLuaSprite('pared', false)
        scaleObject('pared', 0.6, 0.6)
        setObjectOrder('pared', 0)
    
        makeLuaSprite('piso', 'stages/dimon/piso', -550, -135)
        addLuaSprite('piso', false)
        scaleObject('piso', 0.6, 0.6)
        setObjectOrder('piso', 0)

        makeLuaSprite('bordes', 'stages/dimon/bordes', -525, -95)
        addLuaSprite('bordes', false)
        scaleObject('bordes', 0.5547, 0.5547)
        setBlendMode('bordes', 'multiply')
        setObjectOrder('bordes', 0)

        --Woody stage

        makeLuaSprite('woody', 'stages/dimon/woody', -555, -100)
        addLuaSprite('woody', false)
        scaleObject('woody', 0.575, 0.575)
        setObjectOrder('woody', 0)

        makeAnimatedLuaSprite('estatica', 'stages/dimon/estatica.miedo', -525, -95)
        addAnimationByPrefix('estatica', 'estatica', 'estatica', 24, true)
        addLuaSprite('estatica', false)
        setProperty('estatica.antialiasing', false)
        setObjectOrder('estatica', 0)

        makeAnimatedLuaSprite('estatica flash', 'stages/dimon/estatica.miedo', -525, -95)
        addAnimationByPrefix('estatica flash', 'estatica', 'estatica', 24, true)
        addLuaSprite('estatica flash', false)
        setProperty('estatica flash.antialiasing', false)
        setObjectOrder('estatica flash', 0)

        makeAnimatedLuaSprite('fuego', 'stages/dimon/fuegonic', -900, 330)
        addAnimationByPrefix('fuego', 'fire', 'fire', 24, true)
        addLuaSprite('fuego', false)
        setBlendMode('fuego', 'overlay')
        scaleObject('fuego', 0.65, 0.65)
        setObjectOrder('fuego', 0)

        makeAnimatedLuaSprite('tails', 'stages/dimon/tails', 500, 350)
        addAnimationByPrefix('tails', 'tails', 'tails', 24, false)
        addLuaSprite('tails', false)
        setObjectOrder('tails', 0)
        setProperty('tails.alpha', 0)

        makeLuaSprite('bordes sonic', 'stages/dimon/bordes sonicfuego', -525, -95)
        addLuaSprite('bordes sonic', false)
        scaleObject('bordes sonic', 0.5547, 0.5547)
        setBlendMode('bordes sonic', 'add')
        setObjectOrder('bordes sonic', 0)
    else
        apoco = false
        addCharacterToList('marrito', 'dad')
        addCharacterToList('mickeypng', 'dad')
        addCharacterToList('crashpng', 'dad')
        addCharacterToList('woodypng', 'dad')
    end
end

function onBeatHit()
    if apoco then
        if curBeat == 32 then
            setProperty('dad.alpha', 1)
            setProperty('iconP2.alpha', 1)
            triggerEvent('Play Animation', 'intro', 'dad')
            setProperty('estatica.alpha', 0)
            setProperty('estatica flash.alpha', 0)
        end

        if curBeat == 51 then
            flash()

            setProperty('layer3.alpha', 0)
            setProperty('layer3dos.alpha', 0)
            setProperty('layer2.alpha', 0)
            setProperty('layer2dos.alpha', 0)
            setProperty('layer1.alpha', 0)
            setProperty('layer1dos.alpha', 0)
            removeLuaSprite('skybox')
            removeLuaSprite('emblem')
        
            triggerEvent('Change Character', 'dad', 'sonic dimon')
        end

        if curBeat == 188 then
            triggerEvent('Play Animation', 'jump', 'dad')

            setProperty('estatica.alpha', 1)
            setProperty('coolrash border.alpha', 0)

            setObjectOrder('estatica', getObjectOrder('dadGroup') - 1)
            setObjectOrder('sonicname', 10)
        end

        if curBeat == 190 then
            triggerEvent('Change Character', 'dad', 'coolrashintro')
            triggerEvent('Play Animation', 'intro', 'dad')
        end

        if curBeat == 192 then
            setObjectOrder('coolrash border', getObjectOrder('dadGroup') + 1)
            doTweenAlpha('estatica', 'estatica', 0, 1, 'linear')
            doTweenAlpha('coolrash border', 'coolrash border', 1, 1, 'linear')

            triggerEvent('Change Character', 'dad', 'coolrash')

            setProperty('skybox dimon.alpha', 0)
            setProperty('layer3 dimon.alpha', 0)
            setProperty('layer3dos dimon.alpha', 0)
            setProperty('layer2 dimon.alpha', 0)
            setProperty('layer2dos dimon.alpha', 0)
            setProperty('layer1 dimon.alpha', 0)
            setProperty('layer1dos dimon.alpha', 0)
            setProperty('emblem dimon.alpha', 0)
            setProperty('sonicname.alpha', 0)
        end

        if curBeat == 316 then
            removeLuaSprite('coolrash border')
            doTweenX('jumpscarex', 'jumpscare.scale', 0.5547, 0.5, 'circOut')
            doTweenY('jumpscarey', 'jumpscare.scale', 0.5547, 0.5, 'circOut')
            setObjectOrder('jumpscare', getObjectOrder('dadGroup') + 1)
            setProperty('estatica.alpha', 1)
            setObjectOrder('estatica', getObjectOrder('jumpscare') - 1)
        end

        if curBeat == 320 then
            removeLuaSprite('jumpscare')
            flash()
            setProperty('estatica.alpha', 0)
            triggerEvent('Change Character', 'dad', 'mickey')

            removeLuaSprite('coolrash stage')
            
            setObjectOrder('paredes', 13)
            setObjectOrder('edificios', 14)
            setObjectOrder('plataforma', 15)
            setObjectOrder('bordes miki', getObjectOrder('dadGroup') + 1)
        end

        if curBeat == 380 then
            flash()
            triggerEvent('Change Character', 'dad', 'crash')

            removeLuaSprite('fondo')
            removeLuaSprite('paredes')
            removeLuaSprite('edificios')
            removeLuaSprite('plataforma')
            removeLuaSprite('bordes miki')

            setObjectOrder('piso', 11)
            setObjectOrder('bordes', getObjectOrder('dadGroup') + 1)
        end

        if curBeat == 512 then
            flash()
            triggerEvent('Change Character', 'dad', 'woody')

            removeLuaSprite('pared')
            removeLuaSprite('piso')

            setObjectOrder('bordes', getObjectOrder('dadGroup') + 1)
        end

        if curBeat == 648 then
            flash()
            triggerEvent('Change Character', 'dad', 'sonic dimon')

            removeLuaSprite('woody')
            removeLuaSprite('bordes')

            setProperty('skybox dimon.alpha', 1)
            setProperty('layer3 dimon.alpha', 1)
            setProperty('layer3dos dimon.alpha', 1)
            setProperty('layer2 dimon.alpha', 1)
            setProperty('layer2dos dimon.alpha', 1)
            setProperty('layer1 dimon.alpha', 1)
            setProperty('layer1dos dimon.alpha', 1)
            setProperty('emblem dimon.alpha', 1)
            setProperty('sonicname.alpha', 1)

            setObjectOrder('sonicname', 20)
        end

        if curBeat == 784 then
            flash()
            setObjectOrder('fuego', getObjectOrder('dadGroup') + 1)
            setObjectOrder('tails', getObjectOrder('fuego'))
            setObjectOrder('bordes sonic', getObjectOrder('tails'))
        end
    end

    if not apoco then
        if curBeat == 192 then
            removeLuaSprite('modo mago 1')
            triggerEvent('Change Character', 'dad', 'marrito')
        end

        if curBeat == 320 then
            removeLuaSprite('modo mago 2')
            triggerEvent('Change Character', 'dad', 'mickeypng')
        end

        if curBeat == 380 then
            removeLuaSprite('modo mago 3')
            triggerEvent('Change Character', 'dad', 'crashpng')
        end

        if curBeat == 512 then
            removeLuaSprite('modo mago 4')
            triggerEvent('Change Character', 'dad', 'woodypng')
        end

        if curBeat == 648 then
            removeLuaSprite('modo mago 5')
            triggerEvent('Change Character', 'dad', 'dotsexi')
        end
    end
end

function onStepHit()
    if apoco then
        if curStep == 1273 then
            setProperty('jumpscare.visible', false)
        end

        if curStep == 1274 then
            setProperty('jumpscare.visible', true)
        end

        if curStep == 1275 then
            setProperty('jumpscare.visible', false)
        end

        if curStep == 1276 then
            setProperty('jumpscare.visible', true)
        end

        if curStep == 1277 then
            setProperty('jumpscare.visible', false)
        end

        if curStep == 1278 then
            setProperty('jumpscare.visible', true)
        end

        if curStep == 1279 then
            setProperty('jumpscare.visible', false)
        end

        if curStep == 3321 then
            playAnim('tails', 'tails')
            setProperty('tails.alpha', 1)
        end
    end
end

function flash()
    setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup') + 3)
    setObjectOrder('estatica flash', getObjectOrder('dadGroup') + 2)
    setProperty('estatica flash.alpha', 1)
    doTweenAlpha('estatica flash', 'estatica flash', 0, 1, 'linear')
end

function onUpdate()
    if getProperty('tails.animation.finished') then
        setProperty('tails.alpha', 0)
    end
end

function onDestroy()
    for i = 1,4 do
        setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset['..(i-1)..']', savedPos[i])
    end
end
