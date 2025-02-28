local defaultOffset = {}
local shake = false

function onCreate()
    makeLuaSprite('murice', 'stages/balanced/tag murice', 1290, 350)
	addLuaSprite('murice', true)
    setObjectCamera('murice', 'hud')
    scaleObject('murice', 0.6, 0.6)

    precacheImage('stages/balanced/tag pootto')
    precacheImage('stages/balanced/tag fish')
end

function onCreatePost()
    defaultOffset[1] = getProperty('murice.offset.x')
    defaultOffset[2] = getProperty('murice.offset.y')
end

function onSongStart()
    doTweenX('murice', 'murice', 860, 1, 'quintOut')
    runTimer('tag', 2.75)
end

function onStepHit()
    if curStep == 560 then
        makeLuaSprite('tag pootto', 'stages/balanced/tag pootto', 1290, 350)
        addLuaSprite('tag pootto', true)
        setObjectCamera('tag pootto', 'hud')
        scaleObject('tag pootto', 0.6, 0.6)
        doTweenX('tag pootto', 'tag pootto', 860, 1, 'quintOut')
        runTimer('teg', 1.83)
    end

    if curStep == 1002 then
        makeLuaSprite('tag fish', 'stages/balanced/tag fish', 1290, 350)
        addLuaSprite('tag fish', true)
        setObjectCamera('tag fish', 'hud')
        scaleObject('tag fish', 0.6, 0.6)
        doTweenX('tag fish', 'tag fish', 860, 1, 'quintOut')
        runTimer('tig', 1.56)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'tag' then
        runTimer('bye', 3)
        doTweenX('muricebye', 'murice', 1290, 1, 'quintIn')
    end

    if tag == 'teg' then
        shake = true
        runTimer('bye2', 2.5)
        doTweenAngle('poottofall', 'tag pootto', -145, 1.15, 'SineInOut')
        doTweenY('poottobye1', 'tag pootto', 1000, 1.15, 'SineInOut')
        doTweenX('poottobye2', 'tag pootto', 1000, 1.15, 'SineInOut')
    end

    if tag == 'tig' then
        shake = true
        runTimer('bye3', 2.5)
        doTweenAngle('fishfall', 'tag fish', -145, 1.15, 'SineInOut')
        doTweenY('fishbye1', 'tag fish', 1000, 1.15, 'SineInOut')
        doTweenX('fishbye2', 'tag fish', 1000, 1.15, 'SineInOut')
    end

    if tag == 'bye' then
        removeLuaSprite('murice', true)
    end

    if tag == 'bye2' then
        shake = false
        removeLuaSprite('tag pootto', true)
    end

    if tag == 'bye3' then
        removeLuaSprite('tag fish', true)
    end
end

function onUpdatePost()
    if shake then
        setProperty('tag pootto.offset.x', defaultOffset[1] + getRandomFloat(-15, 15))
        setProperty('tag pootto.offset.y', defaultOffset[2] + getRandomFloat(-15, 15))
        setProperty('tag fish.offset.x', defaultOffset[1] + getRandomFloat(-15, 15))
        setProperty('tag fish.offset.y', defaultOffset[2] + getRandomFloat(-15, 15))
    end
end