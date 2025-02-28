local hudTimes = {'HundredSeconds','TenSeconds','Seconds'}

local numbersOffset = {100,100} --Don't change this
local directory = 'stages/jojo'

function onCreate()
    local numberDirectory = directory..'/VINumeros'

    makeLuaSprite('TimeSprite', directory..'/TIME', 0, 2)
    setObjectCamera('TimeSprite', 'hud')
    setObjectOrder('TimeSprite', 17)
    scaleObject('TimeSprite', 0.8, 0.8)
    screenCenter('TimeSprite', 'x')
    setProperty('TimeSprite.alpha', 0)

    for time = 1,#hudTimes do
        makeLuaSprite(hudTimes[time]..'Text', nil, 0, 0)
        loadGraphic(hudTimes[time]..'Text', numberDirectory, numbersOffset[1], numbersOffset[2])
        addAnimation(hudTimes[time]..'Text', 'timeHud', {0,1,2,3,4,5,6,7,8,9}, 0, true)
        setObjectCamera(hudTimes[time]..'Text', 'hud')
        scaleObject(hudTimes[time]..'Text', 0.45, 0.45)
        setObjectOrder(hudTimes[time]..'Text', 18)
        setProperty(hudTimes[time]..'Text.alpha', 0)
    end
end

function onCreatePost()
    if timeBarType == 'Time Left' or timeBarType == 'Song Name' then
        setProperty('SecondsText.x', 647.5)
        setProperty('TenSecondsText.x', 617.5)
        setProperty('HundredSecondsText.x', 587.5)
    else
        setProperty('HundredSecondsText.visible', false)
        setProperty('SecondsText.x', 632.5)
        setProperty('TenSecondsText.x', 602.5)
    end

    if downscroll then
        setProperty('TimeSprite.y', 540)
        setProperty('SecondsText.y', 605)
        setProperty('TenSecondsText.y', 605)
        setProperty('HundredSecondsText.y', 605)
    else
        setProperty('SecondsText.y', 67)
        setProperty('TenSecondsText.y', 67)
        setProperty('HundredSecondsText.y', 67)
    end
end

function onUpdate()
    local songPos = math.max(0, getSongPosition())
    local remainingTime = math.max(0, songLength - songPos)

    if timeBarType == 'Time Left' or timeBarType == 'Song Name' then
        setProperty('SecondsText.animation.curAnim.curFrame',math.floor((remainingTime/1000) % 10))
        setProperty('TenSecondsText.animation.curAnim.curFrame',math.floor((remainingTime/10000) % 10))
        setProperty('HundredSecondsText.animation.curAnim.curFrame',math.floor((remainingTime/100000) % 10))

        if remainingTime < 100000 then
            setProperty('HundredSecondsText.visible', false)
            setProperty('SecondsText.x', 632.5)
            setProperty('TenSecondsText.x', 602.5)
        end
    elseif timeBarType == 'Time Elapsed' then
        setProperty('SecondsText.animation.curAnim.curFrame',math.floor((songPos/1000) % 10))
        setProperty('TenSecondsText.animation.curAnim.curFrame',math.floor((songPos/10000) % 10))
        setProperty('HundredSecondsText.animation.curAnim.curFrame',math.floor((songPos/100000) % 10))

        if songPos > 100000 then
            setProperty('HundredSecondsText.visible', true)
            setProperty('SecondsText.x', 647.5)
            setProperty('TenSecondsText.x', 617.5)
            setProperty('HundredSecondsText.x', 587.5)
        end
    end
end