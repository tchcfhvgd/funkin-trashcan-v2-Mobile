local allowEnding = false

function onCreate()
    precacheSound('Try Again')
    precacheSound('Ok')
    precacheSound('Superb')

    precacheImage('stages/paradise/Try Again')
    precacheImage('stages/paradise/Ok')
    precacheImage('stages/paradise/Superb')
end

function onEndSong()
    setProperty('Go for a Perfect.visible', false)
    setProperty('P.alpha', 0)

    if not allowEnding and not botPlay and not practice then
        runTimer('start', 1)
        return Function_Stop;
    end
end

function onTimerCompleted(tag)
    if tag == 'start' then
        if rating < 0.6 then
            runTimer('death', 5)
            playSound('Try Again')

            makeLuaSprite('Try Again', 'stages/paradise/Try Again', 0, 130)
            addLuaSprite('Try Again', false)
            setObjectCamera('Try Again', 'other')
            screenCenter('Try Again', 'x')

            makeLuaText('Try Againtxt', 'Into the trash bin you go.', 0, 0, 510)
            setTextSize('Try Againtxt', 40)
            addLuaText('Try Againtxt', true)
            setTextFont('Try Againtxt', 'Roboto.ttf')
            screenCenter('Try Againtxt', 'x')
            setObjectOrder('Try Againtxt', 55)
        elseif rating < 0.8 then
            runTimer('end', 5)
            playSound('Ok')

            makeLuaSprite('Ok', 'stages/paradise/Ok', 0, 130)
            addLuaSprite('Ok', false)
            setObjectCamera('Ok', 'other')
            screenCenter('Ok', 'x')

            makeLuaText('Oktxt', 'Eh. Good enough.', 0, 0, 510)
            setTextSize('Oktxt', 40)
            addLuaText('Oktxt', true)
            setTextFont('Oktxt', 'Roboto.ttf')
            screenCenter('Oktxt', 'x')
            setObjectOrder('Oktxt', 55)
        elseif rating >= 0.8 then
            runTimer('end', 5)
            playSound('Superb')
    
            makeLuaSprite('Superb', 'stages/paradise/Superb', 0, 130)
            addLuaSprite('Superb', false)
            setObjectCamera('Superb', 'other')
            screenCenter('Superb', 'x')
    
            makeLuaText('Superbtxt', 'That was great! Really great!', 0, 0, 510)
            setTextSize('Superbtxt', 40)
            addLuaText('Superbtxt', true)
            setTextFont('Superbtxt', 'Roboto.ttf')
            screenCenter('Superbtxt', 'x')
            setObjectOrder('Superbtxt', 55)
        end
    end

    if tag == 'end' then
        allowEnding = true
        endSong()
    end

    if tag == 'death' then
        setHealth(0)
    end
end