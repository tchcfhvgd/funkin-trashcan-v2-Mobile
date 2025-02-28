local isOldIcon = false
local ogcolor = getProperty('boyfriend.healthColorArray')

function onUpdatePost()
    if keyboardJustPressed('NINE') then
        callMethod('iconP1.changeIcon', {isOldIcon and getProperty('boyfriend.healthIcon') or 'maurice'})
        ogcolor = rgbToHex(getProperty('boyfriend.healthColorArray'))
        if isOldIcon then
            setHealthBarColors('', ogcolor)
        else
            setHealthBarColors('', '87fffb')
        end
        isOldIcon = not isOldIcon
    end
end

function rgbToHex(rgb)
    rgbT = rgb or {0,0,0}
    return string.format('%02x%02x%02x', math.floor(rgbT[1]), math.floor(rgbT[2]), math.floor(rgbT[3]))
end
