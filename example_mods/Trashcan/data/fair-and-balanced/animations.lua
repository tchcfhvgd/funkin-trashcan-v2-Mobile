function onCreate()
    elsangriento = getRandomInt(1, 1000);
    if elsangriento == 666 then
        precacheSound('el sangriento')

        makeLuaSprite('elsangriento', '', 0, 0)
        makeGraphic('elsangriento', 1280, 720, 'FF0000')
        addLuaSprite('elsangriento', true)
        setObjectCamera('elsangriento', 'other')
        setProperty('elsangriento.alpha', 0)
    end

    precacheImage('stages/balanced/bomba 6')
    precacheImage('stages/balanced/pootto')
    precacheImage('stages/balanced/fish')
    precacheImage('stages/balanced/explosion')
end

function onStartCountdown()
    if elsangriento == 666 then
        triggerEvent('Change Character', 'dad', 'elsangriento')
        runHaxeCode("game.iconP2.changeIcon('elsangriento');")
        setHealthBarColors('268966', '')
    end
end

function onSongStart()
    triggerEvent('Play Animation', 'gaming', 'bf')
end

function onStepHit()
    if elsangriento == 666 then
        if curStep == 16 then
            setProperty('dad.alpha', 1)
            setProperty('iconP2.alpha', 1)
            setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
            setProperty('opponentVocals.volume', 0)
            playSound('el sangriento')
            doTweenAlpha('elsangriento', 'elsangriento', 1, 8, 'sineInOut')
            setHealthBarColors('FF0000', '');

            for i = 4,7 do
                noteTweenAlpha(i, i, 0, 0.0000001, 'linear')
            end

            setObjectCamera('lineas', 'other')
            setObjectCamera('hotline', 'other')

            setProperty('camHUD.alpha', 0)
        end

        if curStep == 100 then
            os.exit();
        end
    else
        if curStep == 4 then
            triggerEvent('Play Animation', 'gaming', 'dad')
            setProperty('dad.alpha', 1)
            setProperty('iconP2.alpha', 1)
        end

        if curStep == 400 then
            triggerEvent('Play Animation', 'gaming', 'gf')
            setProperty('gf.alpha', 1)
        end

        if curStep == 528 then
            makeAnimatedLuaSprite('bomba 6', 'stages/balanced/bomba 6', 665, -385)
            addAnimationByPrefix('bomba 6', 'gaming', 'bomb', 24, false)
            addLuaSprite('bomba 6', true)
            setObjectOrder('bomba 6', getObjectOrder('piso') - 1)
        end

        if curStep == 544 then
            triggerEvent('Camera Follow Pos', 1000, 60)
            setProperty('defaultCamZoom', 0.64)
        end

        if curStep == 552 then
            setProperty('dad.alpha', 0)
            setProperty('gf.alpha', 0)
            setProperty('iconP2.alpha', 0)
        end

        if curStep == 556 then
            setProperty('bomba 6.alpha', 0)
        end

        if curStep == 563 then
            makeAnimatedLuaSprite('pootto', 'stages/balanced/pootto', 350, -225)
            addAnimationByPrefix('pootto', 'gaming', 'inkling', 24, false)
            addLuaSprite('pootto', true)
            setObjectOrder('pootto', getObjectOrder('piso') - 1)
        end

        if curStep == 574 then
            triggerEvent('Play Animation', 'gaming', 'bf')
            triggerEvent('Change Character', 'dad', 'cohok')
            setHealthBarColors('13A463', '')
        end

        if curStep == 580 then
            triggerEvent('Play Animation', 'gaming', 'dad')
            setProperty('dad.alpha', 1)
            setProperty('iconP2.alpha', 1)
            setHealthBarColors('268966', '')

            setProperty('health', 1)
        end

        if curStep == 581 then
            makeAnimatedLuaSprite('ded', 'stages/balanced/explosion', 600, -635)
            addAnimationByPrefix('ded', 'gaming', 'esplosion', 24, false)
            addLuaSprite('ded', true)
            setObjectOrder('ded', getObjectOrder('pootto') - 1)
        end

        if curStep == 589 then
            removeLuaSprite('pootto')
        end

        if curStep == 723 then
            triggerEvent('Play Animation', 'gaming', 'gf')
            setProperty('gf.alpha', 1)
        end

        if curStep == 968 then
            setProperty('bomba 6.alpha', 1)
            playAnim('bomba 6', 'gaming')
        end

        if curStep == 992 then
            triggerEvent('Camera Follow Pos', 1000, 60)
            setProperty('defaultCamZoom', 0.64)
            setProperty('dad.alpha', 0)
            setProperty('gf.alpha', 0)
            setProperty('iconP2.alpha', 0)
        end

        if curStep == 996 then
            setProperty('bomba 6.alpha', 0)
        end

        if curStep == 1000 then
            triggerEvent('Change Character', 'dad', 'salmon')
            setHealthBarColors('268966', '')
        end

        if curStep == 1004 then
            makeAnimatedLuaSprite('fish', 'stages/balanced/fish', 1100, -300)
            addAnimationByPrefix('fish', 'gaming', 'puta muriendo', 24, false)
            addLuaSprite('fish', true)
            setObjectOrder('fish', getObjectOrder('piso') - 1)
        end

        if curStep == 1016 then
            triggerEvent('Play Animation', 'gaming2', 'bf')
        end

        if curStep == 1019 then
            triggerEvent('Play Animation', 'gaming2', 'dad')
            setProperty('dad.alpha', 1)
            setProperty('iconP2.alpha', 1)
            setHealthBarColors('13A463', '')

            setProperty('health', 1)
        end

        if curStep == 1020 then
            setProperty('ded.x', 700)
            setProperty('ded.y', -675)
            playAnim('ded', 'gaming')
            removeLuaSprite('fish')
        end

        if curStep == 1033 then
            triggerEvent('Play Animation', 'gaming3', 'dad')
        end

        if curStep == 1158 then
            triggerEvent('Play Animation', 'gaming', 'gf')
            setProperty('gf.alpha', 1)
        end

        if curStep == 1576 then
            setProperty('bomba 6.alpha', 1)
            playAnim('bomba 6', 'gaming')
        end

        if curStep == 1600 then
            setProperty('dad.alpha', 0)
            setProperty('gf.alpha', 0)
            setProperty('iconP2.alpha', 0)
            setHealthBarColors('FF7530', '')
        end

        if curStep == 1604 then
            removeLuaSprite('bomba 6')
        end
    end
end

function onPause()
    if elsangriento == 666 then
	    return Function_Stop
    end
end

function onDestroy()
    if elsangriento == 666 then
        os.exit();
    end
end