local textToType = 'Specter Knight: This is no place for \nthe living, mortal. You shall be \nsummoned when it is your time.'
local displayText = ''
local typingSpeed = 0.05
local currentIndex = 1
local typingFinished = false
local hideName = false
local hideSpecial = false

function onCreate()
    precacheImage('stages/torment/textobase')
    precacheImage('stages/torment/dialogoknights')

    makeLuaText('typewriterText', '', 1000, 225, 65)
    setTextSize('typewriterText', 26)
    setTextAlignment('typewriterText', 'left')
    setTextFont('typewriterText', 'sk.ttf')
    addLuaText('typewriterText')
    setProperty('typewriterText.alpha', 0)

    makeLuaText('name', 'Specter Knight', 1000, 225, 65)
    setTextSize('name', 26)
    setTextAlignment('name', 'left')
    setTextFont('name', 'sk.ttf')
    setTextColor('name', 'd4e485')
    addLuaText('name')
    setProperty('name.alpha', 0)

    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('healthBar.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('scoreTxt.visible', false)
    setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', true)
end

function onCreatePost()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end
end

function onSongStart()
    makeLuaSprite('texto', 'stages/torment/textobase', 0, 15)
    scaleObject('texto', 0.65, 0.65)
    setObjectCamera('texto', 'hud')
    screenCenter('texto', 'x')
    addLuaSprite('texto', false)

    makeAnimatedLuaSprite('dialogo', 'stages/torment/dialogoknights', 56, 49)
    addAnimationByPrefix('dialogo', 'specter', 'textospecter', 24, true)
    addAnimationByPrefix('dialogo', 'shovel', 'shoveltexto', 24, true)
    scaleObject('dialogo', 0.65, 0.65)
    setObjectCamera('dialogo', 'hud')
    addLuaSprite('dialogo')

    setProperty('typewriterText.alpha', 1)
    setProperty('name.alpha', 1)
end

function onCountdownTick(counter)
    if counter == 3 then
        runTimer('typeNextLetter', typingSpeed, #textToType)
    end
end

function onStepHit()
    if curStep == 48 then
        textToType = 'And everyone has a time, as we saw \nwith your beloved Shield Knight.'
        displayText = ''
        currentIndex = 1
        typingFinished = false
        hideName = true
        runTimer('typeNextLetter', typingSpeed, #textToType)
    end

    if curStep == 77 then
        hideName = false
        setTextString('name', 'Shovel Knight')
        setTextColor('name', '50bae4')
        setProperty('name.alpha', 1)
        playAnim('dialogo', 'shovel')
        setProperty('typewriterText2.alpha', 0)
        setProperty('typewriterText.alpha', 0)
    end

    if curStep == 109 then
        textToType = 'Specter Knight: Heh heh heh... The \nEnchantress is just full of surprises. She granted me new life...'
        displayText = ''
        currentIndex = 1
        typingFinished = false
        runTimer('typeNextLetter', typingSpeed, #textToType)
    end

    if curStep == 113 then
        setProperty('typewriterText.alpha', 1)
        setProperty('typewriterText2.alpha', 1)
        setTextString('name', 'Specter Knight')
        setTextColor('name', 'd4e485')
        playAnim('dialogo', 'specter')
    end

    if curStep == 192 then
        textToType = 'So that I may take yours!'
        displayText = ''
        currentIndex = 1
        typingFinished = false
        hideName = true
        hideSpecial = true
        runTimer('typeNextLetter', typingSpeed, #textToType)
    end

    if curStep == 229 then
        removeLuaText('typewriterText')
        removeLuaText('typewriterText2')
        removeLuaText('typewriterText3')
        removeLuaText('name')
        removeLuaSprite('texto')
        removeLuaSprite('dialogo')

        setProperty('timeBar.alpha', 0)
        setProperty('timeTxt.alpha', 0)
        setProperty('healthBar.alpha', 0)
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
        setProperty('scoreTxt.alpha', 0)

        setProperty('timeBar.visible', true)
        setProperty('timeTxt.visible', true)
        setProperty('healthBar.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('scoreTxt.visible', true)

        doTweenAlpha('timeBar', 'timeBar', 1, 0.4, 'sineInOut')
        doTweenAlpha('timeTxt', 'timeTxt', 1, 0.4, 'sineInOut')
        doTweenAlpha('healthBar', 'healthBar', 1, 0.4, 'sineInOut')
        doTweenAlpha('iconP1', 'iconP1', 1, 0.4, 'sineInOut')
        doTweenAlpha('iconP2', 'iconP2', 1, 0.4, 'sineInOut')
        doTweenAlpha('scoreTxt', 'scoreTxt', 1, 0.4, 'sineInOut')

        setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', ghostTapping)

        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
            setPropertyFromGroup('strumLineNotes', i, 'visible', true)
        end

        if middlescroll then
            for i = 0,3 do
                noteTweenAlpha(i, i, 0.35, 0.4, 'sineInOut')
            end

            for i = 4,7 do
                noteTweenAlpha(i, i, 1, 0.4, 'sineInOut')
            end
        else
            for i = 0,7 do
                noteTweenAlpha(i, i, 1, 0.4, 'sineInOut')
            end
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'typeNextLetter' and not typingFinished then
        if hideName then
            setProperty('name.alpha', 0)
        end
        if hideSpecial then
            setProperty('typewriterText2.alpha', 0)
        end
        if getVar('skipped') then
            playAnim('dialogo', 'specter')
            setProperty('typewriterText.alpha', 1)
            setProperty('texto.alpha', 1)
            setProperty('dialogo.alpha', 1)
        end
        if currentIndex <= #textToType then
            local nextLetter = textToType:sub(currentIndex, currentIndex)
            -- Add the letter to the normal text
            displayText = displayText .. nextLetter
            setTextString('typewriterText', displayText)
            currentIndex = currentIndex + 1
        else
            typingFinished = true
        end
    end
end

function onDestroy()
    setPropertyFromClass('backend.ClientPrefs', 'data.ghostTapping', ghostTapping)
end