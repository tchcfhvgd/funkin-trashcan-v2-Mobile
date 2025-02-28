local spoiler = false
local directory = 'stages/jojo/spoiler'

function onCreate()
    if checkFileExists('data/'..songPath..'/SPOILER.txt') then
        spoiler = true

        precacheSound('confirmar vi')

        makeLuaSprite('fondo', directory..'/fondo', 0, 0)
        setObjectCamera('fondo', 'hud')
        setObjectOrder('fondo', 100)

        makeLuaSprite('patron', directory..'/patron', 0, 0)
        setObjectCamera('patron', 'hud')
        setObjectOrder('patron', 100)

        makeLuaSprite('estrellacosa', directory..'/estrellacosa', 0, 0)
        setObjectCamera('estrellacosa', 'hud')
        setObjectOrder('estrellacosa', 100)

        makeLuaSprite('spoilers', directory..'/spoilers', 0, 0)
        setObjectCamera('spoilers', 'hud')
        setObjectOrder('spoilers', 100)

        makeLuaSprite('botone', directory..'/botone', 0, 0)
        setObjectCamera('botone', 'hud')
        setObjectOrder('botone', 100)
    end
end

function onStartCountdown()
    if spoiler then
	    return Function_Stop
    end
end

function onCountdownStarted()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end
end

function onUpdate()
    if spoiler then
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
            spoiler = false
            playSound('confirmar vi', 0.5)
            deleteFile('data/'..songPath..'/SPOILER.txt')
            doTweenAlpha('fondo', 'fondo', 0, 0.5, 'linear')
            doTweenAlpha('patron', 'patron', 0, 0.5, 'linear')
            doTweenAlpha('estrellacosa', 'estrellacosa', 0, 0.5, 'linear')
            doTweenAlpha('spoilers', 'spoilers', 0, 0.5, 'linear')
            doTweenAlpha('botone', 'botone', 0, 0.5, 'linear')
            startCountdown()
        end

        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
            exitSong()
        end
    end
end