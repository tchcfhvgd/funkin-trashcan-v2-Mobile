local textToType = '\n                  Shield Knight'
local displayText = ''
local typingSpeed = 0.05
local currentIndex = 1
local typingFinished = false

function onCreate()
    makeLuaText('typewriterText2', '', 1000, 225, 65)
    setTextSize('typewriterText2', 26)
    setTextAlignment('typewriterText2', 'left')
    setTextFont('typewriterText2', 'sk.ttf')
    setTextColor('typewriterText2', 'eb4718')
    addLuaText('typewriterText2')
end

function onStepHit()
    if curStep == 56 then
        runTimer('typeNextLetter2', typingSpeed, #textToType)
    end

    if curStep == 80 then
        textToType = ' '
        displayText = ''
        currentIndex = 1
        typingFinished = false
        runTimer('typeNextLetter2', typingSpeed, #textToType)
    end

    if curStep == 109 then
        textToType = '                               The \nEnchantress'
        displayText = ''
        currentIndex = 1
        typingFinished = false
        setTextColor('typewriterText2', 'c918c6')
        runTimer('typeNextLetter2', typingSpeed, #textToType)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'typeNextLetter2' and not typingFinished then
        if currentIndex <= #textToType then
            local nextLetter = textToType:sub(currentIndex, currentIndex)
            displayText = displayText .. nextLetter
            setTextString('typewriterText2', displayText)
            currentIndex = currentIndex + 1
        else
            typingFinished = true
        end
    end
end
