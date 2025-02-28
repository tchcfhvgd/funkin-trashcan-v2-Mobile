local textToType = "Shovel Knight: Lies! I won't believe \nsuch talk from phantoms! Your very \nexistence is a vile deception!"
local displayText = ''
local typingSpeed = 0.05
local currentIndex = 1
local typingFinished = false

function onCreate()
    makeLuaText('typewriterText3', '', 1000, 225, 65)
    setTextSize('typewriterText3', 26)
    setTextAlignment('typewriterText3', 'left')
    setTextFont('typewriterText3', 'sk.ttf')
    addLuaText('typewriterText3')
    setProperty('typewriterText3.alpha', 0)
end

function onStepHit()
    if curStep == 73 then
        runTimer('typeNextLetter3', typingSpeed, #textToType)
    end

    if curStep == 77 then
        setObjectOrder('name', 26)
        setProperty('typewriterText3.alpha', 1)
    end

    if curStep == 113 then
        setProperty('typewriterText3.alpha', 0)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'typeNextLetter3' and not typingFinished then
        if currentIndex <= #textToType then
            local nextLetter = textToType:sub(currentIndex, currentIndex)
            displayText = displayText .. nextLetter
            setTextString('typewriterText3', displayText)
            currentIndex = currentIndex + 1
        else
            typingFinished = true
        end
    end
end
