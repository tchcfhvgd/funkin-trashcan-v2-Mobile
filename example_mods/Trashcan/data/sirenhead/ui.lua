local invincTime = 1
local health = 6

function onCreate()
    precacheSound('hurt-grunt-1')
    precacheSound('hurt-grunt-2')
    precacheSound('hurt-grunt-3')
    precacheSound('door')

    setProperty('healthLoss', 0)
    setProperty('healthGain', 0)

    makeLuaSprite('scoreUnderlay', 'stages/sirenhead/ui/stats paper', 0, 620)
    addLuaSprite('scoreUnderlay', false)
    screenCenter('scoreUnderlay','x')
    setObjectCamera('scoreUnderlay', 'hud')

    makeLuaSprite('hearts base', 'stages/sirenhead/ui/hearts base', 65, 75)
    addLuaSprite('hearts base', false)
    setObjectCamera('hearts base', 'hud')
    scaleObject('hearts base', 0.75, 0.75)

    for i = 0,2 do
        makeAnimatedLuaSprite('heart'..i, 'stages/sirenhead/ui/heart', (-65 * i) + 235, 65)
        addLuaSprite('heart'..i, false)
        addAnimationByPrefix('heart'..i, 'full', 'heart anim', 24, false)
        addAnimationByPrefix('heart'..i, 'half', 'halfheart anim', 24, false)
        addAnimationByPrefix('heart'..i, 'empty', 'emptyheart anim', 24, false)
        scaleObject('heart'..i, 0.6, 0.6)
        setObjectCamera('heart'..i, 'hud')
        addOffset('heart'..i, 'half', 19.5, 19)
        addOffset('heart'..i, 'empty', 19.5, 19)
    end

    makeLuaSprite('eveIcon', 'icons/eveicon', 300, 63)
    addLuaSprite('eveIcon', false)
    setObjectCamera('eveIcon', 'hud')
    scaleObject('eveIcon', 0.6, 0.6)

    makeLuaSprite('sirenIcon', 'icons/sirenicon', 10, 55)
    addLuaSprite('sirenIcon', false)
    setObjectCamera('sirenIcon', 'hud')
    scaleObject('sirenIcon', 0.6, 0.6)

    makeLuaSprite('noteUnderlay', 'stages/sirenhead/ui/basebase', 696, 11)
    addLuaSprite('noteUnderlay', false)
    setProperty('noteUnderlay.scale.x', 0.7)
    setProperty('noteUnderlay.scale.y', 0.7)
    setObjectCamera('noteUnderlay', 'hud')

    if downscroll then
        setProperty('scoreUnderlay.flipY', true)
        setProperty('scoreUnderlay.y', -10)
        setProperty('scoreTxt.y', 20)
        setProperty('hearts base.y', 614)
        setProperty('eveIcon.y', 602)
        setProperty('sirenIcon.y', 594)
        setProperty('noteUnderlay.y', 504)

        for i = 0,2 do
            setProperty('heart'..i..'.y', 604)
        end
    else
        setProperty('scoreTxt.y', 670)
    end

    if middlescroll then
        setProperty('noteUnderlay.x', 330)
    end

    setTextFont('scoreTxt', 'Sonic Advanced 2.ttf')
    setTextSize('scoreTxt', 32)
    setTextBorder('scoreTxt', 0, '0x')
    setTextColor('scoreTxt', '392E28')

    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)

    for i = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',i,'isSustainNote') then
            setProperty('unspawnNotes['..i..'].offsetY', -22)
        end
    end
end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'x', -330)
    end

    for i = 4,7 do
        if downscroll then
		    setPropertyFromGroup('strumLineNotes', i, 'y', 586)
        else
            setPropertyFromGroup('strumLineNotes', i, 'y', 92)
        end
    end

    if middlescroll then
        setPropertyFromGroup('strumLineNotes', 4, 'x', 458)
        setPropertyFromGroup('strumLineNotes', 5, 'x', 570)
        setPropertyFromGroup('strumLineNotes', 6, 'x', 682)
        setPropertyFromGroup('strumLineNotes', 7, 'x', 794)
    else
        setPropertyFromGroup('strumLineNotes', 4, 'x', 822)
        setPropertyFromGroup('strumLineNotes', 5, 'x', 934)
        setPropertyFromGroup('strumLineNotes', 6, 'x', 1046)
        setPropertyFromGroup('strumLineNotes', 7, 'x', 1158)
    end
end

function onStepHit()
    if health == 6 then
        if curStep == 2272 then
            playSound('door', 1, 'door')
            setProperty('door.alpha', 1)
            playAnim('door', 'spawn')
        end
    end
end

function onPause()
    pauseSound('door')
end

function onResume()
    resumeSound('door')
end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote then
        lostHP()
    end
end

function noteMissPress(direction)
    lostHP()
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('eveIcon.scale.y', 0.7)
        setProperty('eveIcon.scale.x', 0.7)
        setProperty('sirenIcon.scale.y', 0.7)
        setProperty('sirenIcon.scale.x', 0.7)
        doTweenX('IconX', 'eveIcon.scale', 0.6, 0.4, 'sineout')
        doTweenY('IconY', 'eveIcon.scale', 0.6, 0.4, 'sineout')
        doTweenX('Icon2X', 'sirenIcon.scale', 0.6, 0.4, 'sineout')
        doTweenY('Icon2Y', 'sirenIcon.scale', 0.6, 0.4, 'sineout')
    end

    if curBeat % 2 == 0 then
        if health == 6 then
            for i = 0,2 do
                playAnim('heart'..i, 'full', true)
            end
        end

        if health == 5 then
            for i = 1,2 do
                playAnim('heart'..i, 'full', true)
            end
            playAnim('heart0', 'half', true)
        end

        if health == 4 then
            for i = 1,2 do
                playAnim('heart'..i, 'full', true)
            end
            playAnim('heart0', 'empty', true)
        end

        if health == 3 then
            playAnim('heart0', 'empty', true)
            playAnim('heart1', 'half', true)
            playAnim('heart2', 'full', true)
        end

        if health == 2 then
            playAnim('heart0', 'empty', true)
            playAnim('heart1', 'empty', true)
            playAnim('heart2', 'full', true)
        end

        if health == 1 then
            playAnim('heart0', 'empty', true)
            playAnim('heart1', 'empty', true)
            playAnim('heart2', 'half', true)
        end
    end

    if getProperty('boyfriend.animation.curAnim.finished') == true then
		setProperty('boyfriend.skipDance', false)
	end
end

function onUpdate(elapsed)
    invincTime = invincTime - elapsed

    if getProperty('door.animation.finished') and getProperty('door.animation.name') == 'spawn' then
        playAnim('door', 'door')
    end
end

function onUpdateScore()
    songAcc = getProperty('ratingPercent')

    if ratingFC == '' or ratingFC == nil then
        setTextString('scoreTxt', 'Score: 0 | Rating: ?')
    else
        setTextString('scoreTxt','Score: '..score..' | Rating: '..ratingName..' | Acc: ('..(math.floor(songAcc * 10000) / 100)..'%) - '..ratingFC)
    end
end

function lostHP()
    if invincTime <= 0 then
        playSound('hurt-grunt-'..getRandomInt(1, 3))

        playAnim('boyfriend', 'hurt', true)
        setProperty('boyfriend.skipDance', true)
        invincTime = 1
        health = health - 1

        if health == 5 then
            playAnim('heart0', 'half', true)
        end

        if health == 4 then
            playAnim('heart0', 'empty', true)
        end

        if health == 3 then
            playAnim('heart1', 'half', true)
        end

        if health == 2 then
            playAnim('heart1', 'empty', true)
        end

        if health == 1 then
            playAnim('heart2', 'half', true)
        end

        if health <= 0 then
            setProperty('health', -500)
        end
    end
end

local isOldIcon = false

function onUpdatePost()
    if keyboardJustPressed('NINE') then
        if isOldIcon then
            loadGraphic('eveIcon', 'icons/icon-maurice', 150)
            setProperty('eveIcon.flipX', true)
        else
            loadGraphic('eveIcon', 'icons/eveicon')
            setProperty('eveIcon.flipX', false)
        end
        isOldIcon = not isOldIcon
    end
end
