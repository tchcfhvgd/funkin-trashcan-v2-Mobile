local spoiler = false
local directory = 'stages/dangan'

function onCreate()
    if checkFileExists('data/'..songPath..'/SPOILER.txt') then
        spoiler = true

        precacheSound('dead room')
    
        makeLuaSprite('blackSquare2', '', 0, 0)
        makeGraphic('blackSquare2', 1280, 720, '000000')
        setObjectCamera('blackSquare2', 'hud')
        screenCenter('blackSquare2')
        setObjectOrder('blackSquare2', 99)

        makeLuaSprite('textbox', directory..'/textbox', 0, 0)
        setObjectCamera('textbox', 'hud')
        setObjectOrder('textbox', 100)
        screenCenter('textbox')

        makeLuaText('spoilertext', 'This song contains spoilers for \nDanganronpa 2: Goodbye Despair', 0, 0, 235)
        setTextFont('spoilertext', 'NotoSans.ttf')
        setTextSize('spoilertext', 30)
        setTextBorder('spoilertext', 0, 'FFFFFF')
        screenCenter('spoilertext', 'x')
        addLuaText('spoilertext')

        makeLuaText('spoilertext2', 'Press SPACE to continue', 0, 0, 405)
        setTextFont('spoilertext2', 'NotoSans.ttf')
        setTextSize('spoilertext2', 30)
        setTextBorder('spoilertext2', 0, 'FFFFFF')
        screenCenter('spoilertext2', 'x')
        addLuaText('spoilertext2')

        makeLuaText('spoilertext3', 'Press ESC to exit the song', 0, 0, 480)
        setTextFont('spoilertext3', 'NotoSans.ttf')
        setTextSize('spoilertext3', 30)
        setTextBorder('spoilertext3', 0, 'FFFFFF')
        screenCenter('spoilertext3', 'x')
        addLuaText('spoilertext3')
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
            playSound('dead room', 0.6)
            deleteFile('data/'..songPath..'/SPOILER.txt')
            doTweenAlpha('blackSquare2', 'blackSquare2', 0, 0.5, 'linear')
            doTweenAlpha('textbox', 'textbox', 0, 0.5, 'linear')
            doTweenAlpha('spoilertext', 'spoilertext', 0, 0.5, 'linear')
            doTweenAlpha('spoilertext2', 'spoilertext2', 0, 0.5, 'linear')
            doTweenAlpha('spoilertext3', 'spoilertext3', 0, 0.5, 'linear')
            startCountdown()
        end

        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
            exitSong()
        end
    end
end