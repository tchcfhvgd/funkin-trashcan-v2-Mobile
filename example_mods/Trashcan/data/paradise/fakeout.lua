function onCreate()
	makeLuaSprite('blackSquare', '', 0, 0)
    makeGraphic('blackSquare', 1280, 720, '000000')
    setObjectCamera('blackSquare', 'hud')
    screenCenter('blackSquare')
    setObjectOrder('blackSquare', 50)
    addLuaSprite('blackSquare', true)
    setProperty('blackSquare.alpha', 0)
end

function onSongStart()
    setProperty('songLength', 127000)
end

function onBeatHit()

    if curBeat == 288 then
        doTweenAlpha('blackSquare', 'blackSquare', 1, 2.5)
    end

    if curBeat == 297 then
        setProperty('songLength', songLength)
    end

    if curBeat == 298 then
        doTweenAlpha('blackSquare', 'blackSquare', 0, 1)
    end

    if curBeat == 332 then
        doTweenAlpha('blackSquare', 'blackSquare', 1, 2.5)
    end
end
