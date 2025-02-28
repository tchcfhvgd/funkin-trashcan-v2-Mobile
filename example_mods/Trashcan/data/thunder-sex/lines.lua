local volumen = false
local finished = false

function onCreate()
    for i=1,14 do
        precacheSound('sexo/sexo'..i)
    end
end

function onGameOverStart()
    runTimer('line', 1.8)
end

function onUpdate(elapsed)
    if inGameOver and not volumen and not finished then
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.2);
    end
end

function onGameOverConfirm()
    volumen = true
    cancelTimer('line')
    stopSound('pepe')
end

function onTimerCompleted(tag)
    if tag == 'line' then
        finished = true
        playSound('sexo/sexo'..getRandomInt(1, 14), 1, 'pepe')
    end
end

function onSoundFinished(tag)
    if tag == 'pepe' and not volumen then
        soundFadeIn(nil, 3, 0.2, 1)
    end
end