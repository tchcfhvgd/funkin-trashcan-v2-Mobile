local spoiler = false
local directory = 'bridge/spoiler'

function onCreate()
    if checkFileExists('data/'..songPath..'/SPOILER.txt') then
        spoiler = true

        precacheSound('bridgejingle')
        precacheSound('bridgeblip')
        runTimer('iseta', 0.5)

        makeLuaSprite('background', 'stages/'..directory..'/background', 0, 0)
        setObjectCamera('background', 'hud')
        setObjectOrder('background', 100)

        makeLuaSprite('spoiler', 'stages/'..directory..'/spoiler', 0, 0)
        setObjectCamera('spoiler', 'hud')
        setObjectOrder('spoiler', 100)
        screenCenter('spoiler')

        makeLuaText('spoilertext', 'This song contains spoilers for \nPhoenix Wright: Ace Attorney - Trials and Tribulations', 0, 0, 375)
        setTextFont('spoilertext', 'igiari.ttf')
        setTextSize('spoilertext', 20)
        setTextBorder('spoilertext', 0, 'FFFFFF')
        screenCenter('spoilertext', 'x')
        addLuaText('spoilertext')

        makeLuaText('spoilertext2', 'Press SPACE to continue   Press ESC to exit the song', 0, 0, 435)
        setTextFont('spoilertext2', 'igiari.ttf')
        setTextSize('spoilertext2', 20)
        setTextBorder('spoilertext2', 0, 'FFFFFF')
        screenCenter('spoilertext2', 'x')
        addLuaText('spoilertext2')

        makeLuaSprite('lineas', 'stages/'..directory..'/lineas', 0, 0)
        setObjectCamera('lineas', 'hud')
        setObjectOrder('lineas', 100)
        setBlendMode('lineas', 'screen')
    end
end

function onStartCountdown()
    if spoiler then
	    return Function_Stop
    end
end

function onUpdate()
    if spoiler then
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
            spoiler = false
            playSound('bridgeblip')
            deleteFile('data/'..songPath..'/SPOILER.txt')
            doTweenAlpha('background', 'background', 0, 0.5, 'linear')
            doTweenAlpha('spoiler', 'spoiler', 0, 0.5, 'linear')
            doTweenAlpha('spoilertext', 'spoilertext', 0, 0.5, 'linear')
            doTweenAlpha('spoilertext2', 'spoilertext2', 0, 0.5, 'linear')
            doTweenAlpha('lineas', 'lineas', 0, 0.5, 'linear')
            startCountdown()
        end

        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
            exitSong()
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'iseta' then
        playSound('bridgejingle')
    end
end