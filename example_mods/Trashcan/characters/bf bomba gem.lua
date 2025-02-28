function onBeatHit()
    apoco = getRandomInt(1, 6)

    if apoco == 6 then
        triggerEvent('Alt Idle Animation', 'bf','-blink')
    else
        triggerEvent('Alt Idle Animation', 'bf','')
    end

end